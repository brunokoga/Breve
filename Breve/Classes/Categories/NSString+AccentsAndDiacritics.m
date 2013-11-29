//
//  NSString+AccentsAndDiacritics.m
//  Breve
//
//  Created by Bruno Koga on 11/29/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "NSString+AccentsAndDiacritics.h"

@implementation NSString (AccentsAndDiacritics)

- (NSString *)stringByRemovingAccentsAndDiacritics
{
    NSMutableString *mutableSelf = [self mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)mutableSelf, NULL, kCFStringTransformStripCombiningMarks, NO);
    return [mutableSelf copy];
}

@end
