//
//  PeopleBasicTheme.m
//  People
//
//  Created by Bruno Koga on 10/15/13.
//  Copyright (c) 2013 CI&T. All rights reserved.
//

#import "BKBreveBasicTheme.h"

@implementation BKBreveBasicTheme

- (UIColor *)backgroundColor
{
    return [UIColor whiteColor];
}

- (UIColor *)foregroundColor
{
    return [UIColor blackColor];
}

- (UIColor *)tintColor
{
    return [UIColor blueColor];
}

- (void)applyAppearance
{
    [[UISwitch appearance] setOnTintColor:[self tintColor]];
    [[UITableView appearance] setTintColor:[self tintColor]];
    [[UITextView appearance] setBackgroundColor:[self backgroundColor]];
    [[UITextView appearance] setTextColor:[self foregroundColor]];
}

@end
