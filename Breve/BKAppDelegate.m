//
//  BKAppDelegate.m
//  iBubs
//
//  Created by Bruno Koga on 11/14/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKAppDelegate.h"
#import "BKBreveSettings.h"
#import "BKBreveURLSchemeManager.h"

@implementation BKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [BKBreveURLSchemeManager setup];
    [[BKBreveSettings generalSettings] applyTheme];
    return YES;
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{    
    [BKBreveURLSchemeManager handleOpenURL:url];
    return YES;
}
@end
