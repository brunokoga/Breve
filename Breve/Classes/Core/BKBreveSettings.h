//
//  BKBubsSettings.h
//  iBubs
//
//  Created by Bruno Koga on 11/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BKBreveThemes.h"

@interface BKBreveSettings : NSObject

@property (nonatomic) BOOL autocorrection;
@property (nonatomic) BOOL autocapitalization;
@property (nonatomic) BOOL spellChecking;
@property (nonatomic) BOOL removeAccentsAndDiacritics;
@property (nonatomic) BKBreveTheme theme;

+ (instancetype)generalSettings;
- (void)applyTheme;

@end
