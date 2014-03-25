//
//  BKBubsMainViewController.m
//  iBubs
//
//  Created by Bruno Koga on 11/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveMainViewController.h"
#import "BKBubsSegmentedControl.h"
#import "BKBreveCore.h"
#import "BKBreveSettings.h"
#import "NSString+AccentsAndDiacritics.h"
#import "BKBreveURLSchemeManager.h"
#import "BKBreveEffectsInputView.h"
#import "BKBreveEffectManager.h"
#import "BKBreveInputAccessoryView.h"

@interface BKBreveMainViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet BKBubsSegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewVerticalBottomSpaceConstraint;
@property (nonatomic) NSRange cursorRange;
@property (strong, nonatomic) BKBreveEffectsInputView *effectsInputView;

@end

@implementation BKBreveMainViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.textView.font = [UIFont systemFontOfSize:26.0];
  [self setUpGestureRecognizers];
//    [self loadInputAccessoryView];
}

- (void)loadInputAccessoryView
{
  //TODO: move everything to the view - remove from controller!
  NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BKBreveInputAccessoryView"
                                               owner:self
                                             options:nil];
  BKBreveInputAccessoryView *inputAccessoryView = nib[0];
  NSString *newTitle;
  newTitle = NSLocalizedString(@"Effects", @"Effects title on main toolbar");
  if (self.textView.inputView)
  {
    newTitle = NSLocalizedString(@"Text", @"Effects title on main toolbar");
  }
  [inputAccessoryView.textOrEffectsButton setTitle:newTitle];
  id<BKTheme> theme = [BKThemeManager theme];
  [inputAccessoryView.textOrEffectsButton setTitleTextAttributes:@{NSForegroundColorAttributeName : [theme tintColor]}
                                                        forState:UIControlStateNormal];
  self.textView.inputAccessoryView = inputAccessoryView;

}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [self applySettings];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];

  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillAppear:)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];

  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillDisappear:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];

  [self.textView becomeFirstResponder];
}

- (void)applySettings
{
  BKBreveSettings *settings = [BKBreveSettings generalSettings];
  self.textView.autocapitalizationType = [settings autocapitalization] ? UITextAutocapitalizationTypeSentences : UITextAutocapitalizationTypeNone;

  self.textView.autocorrectionType = [settings autocorrection] ? UITextAutocorrectionTypeYes: UITextAutocorrectionTypeNo;

  self.textView.spellCheckingType = [settings spellChecking] ? UITextSpellCheckingTypeYes : UITextSpellCheckingTypeNo;

  id<BKTheme> theme = [BKThemeManager theme];
  self.view.backgroundColor = [theme backgroundColor];
  [self.effectsInputView setBackgroundColor:[theme backgroundAlternativeColor]];
  [self loadInputAccessoryView];
  [self.textView setKeyboardAppearance:[theme keyboardAppearance]];

}

- (void)viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Gesture Recognizers
- (void)setUpGestureRecognizers
{
  UISwipeGestureRecognizer *swipeToClear = [UISwipeGestureRecognizer new];
  [swipeToClear setDirection:UISwipeGestureRecognizerDirectionLeft];
  [swipeToClear addTarget:self action:@selector(swipeToClear:)];
  [self.textView addGestureRecognizer:swipeToClear];
}

- (void)swipeToClear:(UISwipeGestureRecognizer *)gestureRecognizer
{
  self.textView.text = @"";
}

- (void)selectSegmentedControlIndexByEffectName:(NSString *)effectName
{
  NSInteger toIndex = 0;
  if ([effectName isEqualToString:@"bubs"])
  {
    toIndex = 1;
  }
  [self.segmentedControl setSelectedSegmentIndex:toIndex];
}

#pragma mark - Keyboard Notifications

- (void)keyboardWillAnimateWithDuration:(NSTimeInterval)animationDuration
                               toHeight:(CGFloat)height
{

  [UIView animateWithDuration:animationDuration
                   animations:^{
                     self.textViewVerticalBottomSpaceConstraint.constant = height;
                     [self.view layoutIfNeeded];
                   }];

}

- (void)keyboardWillAppear:(NSNotification*)notification
{
  NSTimeInterval animationDuration = [(NSNumber*)[notification userInfo][UIKeyboardAnimationDurationUserInfoKey] doubleValue];
  CGRect keyboardRect = [[notification userInfo][UIKeyboardFrameEndUserInfoKey] CGRectValue];

  BOOL isPortrait = UIDeviceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation);
  CGFloat height = isPortrait ? keyboardRect.size.height : keyboardRect.size.width;

  [self keyboardWillAnimateWithDuration:animationDuration
                               toHeight:height];
}

- (void)keyboardWillDisappear:(NSNotification*)notification
{
  NSTimeInterval animationDuration = [(NSNumber*)[notification userInfo][UIKeyboardAnimationDurationUserInfoKey] doubleValue];
  [self keyboardWillAnimateWithDuration:animationDuration
                               toHeight:CGRectZero.size.height];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
  [self adjustInputAccessoryViewToOrientation:toInterfaceOrientation];
}

- (void)adjustInputAccessoryViewToOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{

  CGFloat height = 216.0;
  CGFloat width = [UIScreen mainScreen].bounds.size.width;
  if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation))
  {
    height = 162.0;
    width = [UIScreen mainScreen].bounds.size.height;

  }
  self.textView.inputView.frame = CGRectMake(0, 0, width, height);
}

#pragma mark - IBActions

- (IBAction)effectsButtonPressed:(id)sender
{
  NSString *newTitle;
  newTitle = NSLocalizedString(@"Text", @"Effects title on main toolbar");
  if (self.textView.inputView)
  {
    self.textView.inputView = nil;
    newTitle = NSLocalizedString(@"Effects", @"Effects title on main toolbar");
  }
  else
  {
    if (!self.effectsInputView)
    {
      NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BKBreveEffectsInputView"
                                                   owner:self
                                                 options:nil];
      self.effectsInputView = nib[0];
    }
    id<BKTheme> theme = [BKThemeManager theme];
    [self.effectsInputView setBackgroundColor:[theme backgroundAlternativeColor]];
    self.textView.inputView = self.effectsInputView;
    [self adjustInputAccessoryViewToOrientation:[self interfaceOrientation]];
  }
  [self.textView reloadInputViews];
  BKBreveInputAccessoryView *accessoryView = (BKBreveInputAccessoryView *)self.textView.inputAccessoryView;
  [accessoryView.textOrEffectsButton setTitle:newTitle];

}

- (IBAction)settingsButtonPressed:(id)sender {
  [self performSegueWithIdentifier:@"SettingsSegue" sender:self];
}

- (IBAction)copyButtonPressed:(id)sender {
  [self shareAction];
}

- (IBAction)segmentedControlValueChanged:(id)sender {
  BKBubsSegmentedControl *segmentedControl = sender;
  switch (segmentedControl.selectedSegmentIndex) {
    case BKBubsSegmentedControlIndexNormal:
      self.textView.text = [[BKBreveEffectManager sharedManager] normalText];
      break;
    case BKBubsSegmentedControlIndexBubs:
    {
      [[BKBreveEffectManager sharedManager] setNormalText:self.textView.text];
      NSString *textToBeConverted = self.textView.text;
      BKBreveSettings *settings = [BKBreveSettings generalSettings];
      if ([settings removeAccentsAndDiacritics])
      {
        textToBeConverted = [textToBeConverted stringByRemovingAccentsAndDiacritics];
      }
      self.textView.text = [[BKBreveCore sharedInstance] convertFromNormalToBubs:textToBeConverted];
      break;
    }
    default:
      break;
  }
}

#pragma mark - Real Actions

- (void)shareAction
{
  UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[self.textView.text]
                                                                                       applicationActivities:nil];
  [self presentViewController:activityViewController
                     animated:YES
                   completion:^{

                   }];
}

#pragma mark - UITextFieldDelegate
- (void)textViewDidChange:(UITextView *)textView
{
  if (self.segmentedControl.selectedSegmentIndex == BKBubsSegmentedControlIndexBubs)
  {
    textView.text = [[BKBreveCore sharedInstance] convertFromNormalToBubs:textView.text];
    [textView setSelectedRange:self.cursorRange];
  }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
  [textView scrollRangeToVisible:range];
  NSUInteger location = range.location + [text length];
  NSUInteger length = 0;
  self.cursorRange = NSMakeRange(location, length);
  //fixes normal text
  NSString *normalText = [[BKBreveEffectManager sharedManager] normalText];
  [[BKBreveEffectManager sharedManager] setNormalText:[normalText stringByReplacingCharactersInRange:range withString:text]];
  return YES;
}

@end
