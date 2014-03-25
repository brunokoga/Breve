//
//  BKBubsAboutViewController.m
//  iBubs
//
//  Created by Bruno Koga on 11/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveAboutViewController.h"
#import "BKBreveVersionNumber.h"
@interface BKBreveAboutViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation BKBreveAboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addVersionNumber];
}

- (void)addVersionNumber
{
  NSString *versionNumber = [BKBreveVersionNumber versionNumber];
  self.textView.text = [self.textView.text stringByAppendingFormat:@"\nBreve Text Effects %@", versionNumber];
}

@end
