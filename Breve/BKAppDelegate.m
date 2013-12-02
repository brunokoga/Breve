//
//  BKAppDelegate.m
//  iBubs
//
//  Created by Bruno Koga on 11/14/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKAppDelegate.h"
#import "BKBreveSettings.h"

@implementation BKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[BKBreveSettings generalSettings] applyTheme];
    return YES;
}

@end
