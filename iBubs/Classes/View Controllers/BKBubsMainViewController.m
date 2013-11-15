//
//  BKBubsMainViewController.m
//  iBubs
//
//  Created by Bruno Koga on 11/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBubsMainViewController.h"
#import "BKBubsSegmentedControl.h"

@interface BKBubsMainViewController ()
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
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Keyboard Notifications

//FIXME: Do we need the willHide parameter here?
- (void)keyboardWillHide:(BOOL)willHide
       animationDuration:(NSTimeInterval)animationDuration
          keyboardHeight:(CGFloat)height
{
    if (!willHide)
    {
        //TODO: animate up

    }
    else
    {
        //TODO: animate down
    }

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
   
    [self keyboardWillHide:NO
         animationDuration:animationDuration
            keyboardHeight:keyboardRect.size.height];
}

- (void)keyboardWillDisappear:(NSNotification*)notification
{
    NSTimeInterval animationDuration = [(NSNumber*)[notification userInfo][UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [self keyboardWillHide:YES
         animationDuration:animationDuration
            keyboardHeight:CGRectZero.size.height];
}

- (IBAction)settingsButtonPressed:(id)sender {
}

- (IBAction)copyButtonPressed:(id)sender {
}
@end
