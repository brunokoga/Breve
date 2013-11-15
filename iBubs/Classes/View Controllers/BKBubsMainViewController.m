//
//  BKBubsMainViewController.m
//  iBubs
//
//  Created by Bruno Koga on 11/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBubsMainViewController.h"
#import "BKBubsSegmentedControl.h"
#import "BKBubsCore.h"

@interface BKBubsMainViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet BKBubsSegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewVerticalBottomSpaceConstraint;

@end

@implementation BKBubsMainViewController

#pragma mark - View Lifecycle

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

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
 
    [self keyboardWillAnimateWithDuration:animationDuration
                                 toHeight:keyboardRect.size.height];
}

- (void)keyboardWillDisappear:(NSNotification*)notification
{
    NSTimeInterval animationDuration = [(NSNumber*)[notification userInfo][UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [self keyboardWillAnimateWithDuration:animationDuration
            toHeight:CGRectZero.size.height];
}

#pragma mark - IBActions

- (IBAction)settingsButtonPressed:(id)sender {
}

- (IBAction)copyButtonPressed:(id)sender {
    [self copyTextViewTextToPasteboard];
}

- (IBAction)segmentedControlValueChanged:(id)sender {
    BKBubsSegmentedControl *segmentedControl = sender;
    switch (segmentedControl.selectedSegmentIndex) {
        case BKBubsSegmentedControlIndexNormal:
            self.textView.text = [[BKBubsCore sharedInstance] convertFromBubsToNormal:self.textView.text];
            break;
        case BKBubsSegmentedControlIndexBubs:
            self.textView.text = [[BKBubsCore sharedInstance] convertFromNormalToBubs:self.textView.text];
            break;
        default:
            break;
    }
}

#pragma mark - Real Actions

- (void)copyTextViewTextToPasteboard
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:self.textView.text];
}

#pragma mark - UITextFieldDelegate
- (void)textViewDidChange:(UITextView *)textView
{
    if (self.segmentedControl.selectedSegmentIndex == BKBubsSegmentedControlIndexBubs)
    {
        textView.text = [[BKBubsCore sharedInstance] convertFromNormalToBubs:textView.text];
    }
}

@end
