//
//  BKBubsCore.h
//  iBubs
//
//  Created by Bruno Koga on 11/14/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BKBreveCore : NSObject

@property (strong, nonatomic, readonly) NSArray *normalLetters;
@property (strong, nonatomic, readonly) NSArray *bubsLetters;

+ (id)sharedInstance;

- (NSString *)convertString:(NSString *)string
         fromEffectWithName:(NSString *)fromEffectName
           toEffectWithName:(NSString *)toEffectName;

- (NSString *)convertFromNormalToBubs:(NSString *)string;
- (NSString *)convertFromBubsToNormal:(NSString *)string;

@end
