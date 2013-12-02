//
//  BKBreveDarkTheme.m
//  Breve
//
//  Created by Bruno Koga on 12/2/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveDarkTheme.h"

@implementation BKBreveDarkTheme

- (UIStatusBarStyle)statusBarStyle
{
    return UIStatusBarStyleLightContent;
}

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

- (UIColor *)backgroundAlternativeColor
{
    return [UIColor darkGrayColor];
}

@end
