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

@end