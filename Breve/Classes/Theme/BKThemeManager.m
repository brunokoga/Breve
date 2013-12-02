//
//  PeopleTheme.m
//  People
//
//  Created by Bruno Koga on 10/15/13.
//  Copyright (c) 2013 CI&T. All rights reserved.
//

#import "BKThemeManager.h"
#import "BKBreveBasicTheme.h"

@interface BKThemeManager ()

@property (nonatomic, strong) id<BKTheme> theme;
@end

@implementation BKThemeManager

+ (BKThemeManager *)sharedInstance
{
    static dispatch_once_t once;
    static BKThemeManager *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.theme = [BKBreveBasicTheme new];
    });
    return sharedInstance;
}

+ (id<BKTheme>)theme
{
    return [self sharedInstance].theme;
}

+ (void)setTheme:(id<BKTheme>)theme
{
    [self sharedInstance].theme = theme;
}



@end
