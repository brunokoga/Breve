//
//  BKBubsSettings.h
//  iBubs
//
//  Created by Bruno Koga on 11/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BKBreveSettings : NSObject

@property (nonatomic, readonly) BOOL isColorModeOn;

+ (instancetype)generalSettings;

- (void)enableColorMode;
- (void)disableColorMode;
@end
