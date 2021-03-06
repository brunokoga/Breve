//
//  BKBreveThemes.h
//  Breve
//
//  Created by Bruno Koga on 12/2/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BKTheme.h"

typedef enum BKBreveTheme
{
  BKBreveThemeBasic = 0,
  BKBreveThemeDark = 1,
  BKBreveThemePowerGirl = 2
  
} BKBreveTheme;

@interface BKBreveThemes : NSObject

+ (void)applyTheme:(BKBreveTheme)theme;

@end
