//
//  BKBubsSettings.m
//  iBubs
//
//  Created by Bruno Koga on 11/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveSettings.h"

@implementation BKBreveSettings

+ (instancetype)generalSettings;
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
        [sharedInstance loadSettings];
    });
    return sharedInstance;
}

- (void)loadSettings
{
    [self enableColorMode];
}

- (void)enableColorMode
{
    _isColorModeOn = YES;
}
- (void)disableColorMode
{
    _isColorModeOn = NO;
}

@end
