//
//  BKBreveVersionNumber.m
//  Breve
//
//  Created by Bruno Koga on 11/29/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveVersionNumber.h"

@implementation BKBreveVersionNumber

+ (NSString *)versionNumber
{
    NSString *versionString = [[NSBundle mainBundle]
                                   objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
#ifdef BETA
    NSString *buildNumberString = [[NSBundle mainBundle]
                                   objectForInfoDictionaryKey:@"CFBundleVersion"];
    versionString = [versionString stringByAppendingFormat:@" (%@)", buildNumberString];
#endif
    
    return versionString;
}

@end
