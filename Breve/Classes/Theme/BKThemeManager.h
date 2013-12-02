//
//  PeopleTheme.h
//  People
//
//  Created by Bruno Koga on 10/15/13.
//  Copyright (c) 2013 CI&T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BKTheme.h"
#import "BKBreveThemes.h"

@interface BKThemeManager : NSObject

+ (id<BKTheme>)theme;
+ (void)setTheme:(id<BKTheme>)theme;

@end
