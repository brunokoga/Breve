//
//  BKBreveEffectManager.h
//  Breve
//
//  Created by Bruno Koga on 12/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BKBreveEffect.h"
#import "BKBreveEffectNormal.h" //this is here for initialization's sake. Does it make sense?

@interface BKBreveEffectManager : NSObject
@property (strong, nonatomic) BKBreveEffect *effect;
@property (strong, nonatomic) NSString *normalText;

+ (id)sharedManager;

- (NSString *)convertString:(NSString *)string
                 fromEffect:(BKBreveEffect *)fromEffect
                   toEffect:(BKBreveEffect *)toEffect;

- (NSString *)convertString:(NSString *)string
         fromEffectWithName:(NSString *)fromEffectName
           toEffectWithName:(NSString *)toEffectName;

- (NSString *)convertString:(NSString *)string
                   toEffect:(BKBreveEffect *)effect;
@end
