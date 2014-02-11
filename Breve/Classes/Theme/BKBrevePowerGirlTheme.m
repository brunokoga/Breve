//
//  BKBrevPowerGirlyTheme.m
//  Breve
//
//  Created by Bruno Koga on 2/11/14.
//  Copyright (c) 2014 Bruno Koga. All rights reserved.
//

#import "BKBrevePowerGirlTheme.h"

@implementation BKBrevePowerGirlTheme

- (UIStatusBarStyle)statusBarStyle
{
  return UIStatusBarStyleLightContent;
}

- (UIColor *)backgroundColor
{
  return [UIColor colorWithRed:255.0/255.0
                         green:12.0/255.0
                          blue:121.0/255.0
                         alpha:1.0];

}

- (UIColor *)foregroundColor
{
  return [UIColor whiteColor];
}

- (UIColor *)tintColor
{
  return [UIColor colorWithRed:244.0/255.0
                         green:88.0/255.0
                          blue:208.0/255.0
                         alpha:1.0];

}

- (UIColor *)backgroundAlternativeColor
{
  return [UIColor colorWithRed:242.0/255.0
                         green:12.0/255.0
                          blue:88.0/255.0
                         alpha:1.0];

}

@end
