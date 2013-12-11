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

@interface BKBreveMainViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (copy, nonatomic) NSString *regularText;
@property (weak, nonatomic) IBOutlet BKBubsSegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewVerticalBottomSpaceConstraint;
@property (nonatomic) NSRange cursorRange;

@end

@implementation BKBreveMainViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textView.font = [UIFont systemFontOfSize:26.0];
    [self setUpGestureRecognizers];
    [self loadInputAccessoryView];
}

- (void)loadInputAccessoryView
{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BKBreveInputAccessoryView"
                                                 owner:self
                                               options:nil];
    UIView *inputAccessoryView = nib[0];
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

#pragma mark - IBActions

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
            self.textView.text = self.regularText;
            break;
        case BKBubsSegmentedControlIndexBubs:
        {
            self.regularText = self.textView.text;
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
    //Fixes regular text
    self.regularText = [self.regularText stringByReplacingCharactersInRange:range withString:text];
    return YES;
}

@end
