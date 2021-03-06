//
//  BKBubsMainViewController.m
//  iBubs
//
//  Created by Bruno Koga on 11/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveMainViewController.h"
#import "BKBreveSettings.h"
#import "BKBreveURLSchemeManager.h"
#import "BKBreveEffectManager.h"
#import "BKBreveInputAccessoryView.h"
#import "BKBreveEffectBubs.h"
#import "BKBreveEffectsViewController.h"
#import "BKBreveEffectSquared.h"

@interface BKBreveMainViewController () <UITextViewDelegate, BKBreveEffectDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewVerticalBottomSpaceConstraint;
@property (nonatomic) NSRange cursorRange;
@property (strong, nonatomic) BKBreveEffectsViewController *effectsViewController;

@end

@implementation BKBreveMainViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.textView.font = [UIFont systemFontOfSize:26.0];
  [self setUpGestureRecognizers];
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
    if (!self.effectsViewController)
    {
      NSArray *effects = @[
          [BKBreveEffectNormal new],
          [BKBreveEffectBubs new],
          [BKBreveEffectSquared new]];
      self.effectsViewController = [[BKBreveEffectsViewController alloc] initWithEffects:effects delegate:self];
    }
    self.textView.inputView = self.effectsViewController.view;
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
  BKBreveEffect *effect = [[BKBreveEffectManager sharedManager] effect];
  NSString *textToBeConverted = self.textView.text;
    textView.text = [[BKBreveEffectManager sharedManager] convertString:textToBeConverted
                                                               toEffect:effect];
  
  
  NSUInteger newLocation = [textView.text length] - self.cursorRange.location;
  self.cursorRange = NSMakeRange(newLocation, self.cursorRange.length);
  [textView setSelectedRange:self.cursorRange];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
  [textView scrollRangeToVisible:range];
  //fixes normal text

  NSRange beforeTextRange = NSMakeRange(0, range.location);
  NSString *textBeforeChanges = [textView.text substringWithRange:beforeTextRange];
  
  
  NSString *normalText = [[BKBreveEffectManager sharedManager] normalText];
  
  __block NSUInteger realLocation = 0;
  [textBeforeChanges enumerateSubstringsInRange:beforeTextRange
                        options:NSStringEnumerationByComposedCharacterSequences
                     usingBlock:^(NSString *substring, NSRange substringRange,
                                  NSRange enclosingRange, BOOL *stop)
  {
    if ([normalText rangeOfString:substring].location != NSNotFound) {
      realLocation = realLocation + [substring length];
    } else {
      realLocation = realLocation + [substring lengthOfBytesUsingEncoding:NSUTF32StringEncoding] / 4;
    }
  }];
  
//  NSUInteger realLocation = [textBeforeChanges lengthOfBytesUsingEncoding:NSUTF32StringEncoding] / 4;

  //thanks: http://www.objc.io/issue-9/unicode.html
  //each char is counted once, even if it has 2+ unichars
//  NSString *textInRange = [textView.text substringWithRange:range];
  __block NSUInteger realLength = 0;
  [textView.text enumerateSubstringsInRange:range
                        options:NSStringEnumerationByComposedCharacterSequences
                     usingBlock:^(NSString *substring, NSRange substringRange,
                                  NSRange enclosingRange, BOOL *stop)
  {
    if ([normalText rangeOfString:substring].location != NSNotFound) {
      realLength = realLength + [substring length];
    } else {
      realLength = realLength + [substring lengthOfBytesUsingEncoding:NSUTF32StringEncoding] / 4;
    }
  }];
//  NSUInteger realLength = [textInRange lengthOfBytesUsingEncoding:NSUTF32StringEncoding] / 4;
  //each char before the range is counted once, even if it has 2+ unichars

  NSRange realRange = NSMakeRange(realLocation, realLength);
  
  //this is stored here to pass the information to -textViewDidChange:
  NSString *restOfString = [textView.text substringFromIndex:(range.location + range.length)];
  self.cursorRange = NSMakeRange(restOfString.length, 0);
  

  NSString *newNormalText = [normalText stringByReplacingCharactersInRange:realRange withString:text];
  [[BKBreveEffectManager sharedManager] setNormalText:newNormalText];
  return YES;
}

- (void)effectChanged:(BKBreveEffect *)effect
{
  NSString *textToBeConverted = self.textView.text;
  self.textView.text = [[BKBreveEffectManager sharedManager] convertString:textToBeConverted
                                                                  toEffect:effect];
}
@end
