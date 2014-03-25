//
//  BKBreveInputAccessoryView.m
//  Breve
//
//  Created by Bruno Koga on 12/13/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveInputAccessoryView.h"

@interface BKBreveInputAccessoryView ()
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@end

@implementation BKBreveInputAccessoryView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (void)setup
{
}

@end
