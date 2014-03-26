//
//  BKBreveEffect.h
//  Breve
//
//  Created by Bruno Koga on 12/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BKBreveEffect : NSObject

//deprecated
@property (strong, nonatomic, readonly) NSArray *lettersArray;

//from Normal to Effect
@property (strong, nonatomic, readonly) NSDictionary *toMapping;
//from Effect to Normal
@property (strong, nonatomic, readonly) NSDictionary *fromMapping;

@property (strong, nonatomic, readonly) NSString *effectName;
@property (strong, nonatomic, readonly) NSString *effectDisplayName;

@end
