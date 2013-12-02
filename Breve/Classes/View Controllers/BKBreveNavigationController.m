//
//  BKBubsNavigationController.m
//  iBubs
//
//  Created by Bruno Koga on 11/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveNavigationController.h"

@interface BKBreveNavigationController ()

@end

@implementation BKBreveNavigationController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return [[BKThemeManager theme] statusBarStyle];
}
@end
