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
    return [UIColor colorWithRed:51.0f/255.0f
                           green:51.0f/255.0f
                            blue:51.0f/255.0f
                           alpha:1.0f];
}

- (UIColor *)foregroundColor
{
  return [UIColor colorWithRed:153.0f/255.0f
                         green:153.0f/255.0f
                          blue:153.0f/255.0f
                         alpha:1.0f];
}

- (UIColor *)tintColor
{
  return [UIColor whiteColor];
}

- (UIColor *)backgroundAlternativeColor
{
  return [UIColor colorWithRed:77.0f/255.0f
                         green:77.0f/255.0f
                          blue:77.0f/255.0f
                         alpha:1.0f];
}

- (UIKeyboardAppearance)keyboardAppearance
{
  return UIKeyboardAppearanceDark;
}
@end
