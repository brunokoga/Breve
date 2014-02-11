//
//  BKBubsBaseViewController.m
//  iBubs
//
//  Created by Bruno Koga on 11/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveBaseViewController.h"
#import "BKThemeManager.h"

@interface BKBreveBaseViewController ()

@end

@implementation BKBreveBaseViewController

- (UIStatusBarStyle)preferredStatusBarStyle
{
  id<BKTheme> theme = [BKThemeManager theme];
  return [theme statusBarStyle];
  
}

@end
