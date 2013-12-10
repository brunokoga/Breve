//
//  BKBreveURLSchemeManager.h
//  Breve
//
//  Created by Bruno Koga on 12/10/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString * const BKBreveOpenURLNotification;
NSString * const BKBreveURLSentenceUserInfoKey;
NSString * const BKBreveURLFromEffectUserInfoKey;
NSString * const BKBreveURLToEffectUserInfoKey;

@interface BKBreveURLSchemeManager : NSObject

+ (void)setup;
+ (BOOL)handleOpenURL:(NSURL *)url;

@end
