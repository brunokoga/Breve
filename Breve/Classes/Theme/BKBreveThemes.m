//
//  BKBreveThemes.m
//  Breve
//
//  Created by Bruno Koga on 12/2/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveThemes.h"
#import "BKBreveBasicTheme.h"
#import "BKThemeManager.h"

@implementation BKBreveThemes

+ (id<BKTheme>)themeObjectForTheme:(BKBreveTheme)theme
{
    id<BKTheme> themeObject;
    
    switch (theme) {
        case BKBreveThemeBasic:
            themeObject = [BKBreveBasicTheme new];
            break;
            
        default:
            break;
    }
    return themeObject;
}

+ (void)applyTheme:(BKBreveTheme)theme
{
    id<BKTheme> themeObject = [self themeObjectForTheme:theme];
    [BKThemeManager setTheme:themeObject];
}

@end
