//
//  BKBreveEffectManager.m
//  Breve
//
//  Created by Bruno Koga on 12/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveEffectManager.h"

@implementation BKBreveEffectManager


+ (id)sharedManager
{
    static dispatch_once_t once;
    static BKBreveEffectManager *sharedManager;
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
        sharedManager.effect = [BKBreveEffectNormal new];
        sharedManager.normalText = @"";
    });
    return sharedManager;
}

@end
