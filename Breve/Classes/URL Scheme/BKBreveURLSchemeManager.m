//
//  BKBreveURLSchemeManager.m
//  Breve
//
//  Created by Bruno Koga on 12/10/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveURLSchemeManager.h"
#import "BKBreveCore.h"
#import <InterAppCommunication/IACClient.h>

@implementation BKBreveURLSchemeManager

+ (void)setup
{
    [IACManager sharedManager].callbackURLScheme = @"breve";
    
       [[IACManager sharedManager] handleAction:@"applyEffect"
                                   withBlock:^(NSDictionary *inputParameters, IACSuccessBlock success, IACFailureBlock failure) {
                                       if (success) {
                                           
                                           
                                           NSString *string = inputParameters[@"text"];
                                           NSString *fromEffect = inputParameters[@"fromEffect"];
                                           NSString *toEffect = inputParameters[@"toEffect"];
                                           
                                           BKBreveCore *core = [BKBreveCore sharedInstance];
                                           
                                           NSString *convertedString = [core convertString:string
                                                        fromEffectWithName:fromEffect
                                                          toEffectWithName:toEffect];
                           
                                           NSDictionary *successParameters = @{@"[[output]]": convertedString};
                                           
                                           
                                           success(successParameters, NO);
                                       }
                                   }];
}

+ (BOOL)handleOpenURL:(NSURL *)url
{
    return [[IACManager sharedManager] handleOpenURL:url];
}

/*
 
 [scheme]://[host]/[action]?[x-callback parameters]&[action parameters]

 */

@end
