//
//  PeopleBasicTheme.m
//  People
//
//  Created by Bruno Koga on 10/15/13.
//  Copyright (c) 2013 CI&T. All rights reserved.
//

#import "BKBreveBasicTheme.h"

@implementation BKBreveBasicTheme

- (UIStatusBarStyle)statusBarStyle
{
    return UIStatusBarStyleDefault;
}

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
    return [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
}

- (UIColor *)backgroundAlternativeColor
{
  return [UIColor colorWithRed:233.0f/255.0f
                         green:233.0f/255.0f
                          blue:233.0f/255.0f
                         alpha:1.0f];
}

- (UIKeyboardAppearance)keyboardAppearance
{
  return UIKeyboardAppearanceLight;
}
@end
