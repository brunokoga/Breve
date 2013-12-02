//
//  BKBreveDarkTheme.m
//  Breve
//
//  Created by Bruno Koga on 12/2/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveDarkTheme.h"

@implementation BKBreveDarkTheme

- (UIColor *)backgroundColor
{
    return [UIColor blackColor];
}

- (UIColor *)foregroundColor
{
    return [UIColor lightGrayColor];
}

- (UIColor *)tintColor
{
    return [UIColor redColor];
}

- (void)applyAppearance
{
    [[UISwitch appearance] setOnTintColor:[self tintColor]];
    [[UITableView appearance] setTintColor:[self tintColor]];
    [[UITextView appearance] setBackgroundColor:[self backgroundColor]];
    [[UITextView appearance] setTextColor:[self foregroundColor]];
}
@end
