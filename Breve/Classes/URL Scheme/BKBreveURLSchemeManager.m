//
//  BKBreveURLSchemeManager.m
//  Breve
//
//  Created by Bruno Koga on 12/10/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveURLSchemeManager.h"
#import <SBRXCallbackURLKit/SBRCallbackParser.h>

@implementation BKBreveURLSchemeManager

+ (void)setup
{
    SBRCallbackParser *parser = [SBRCallbackParser sharedParser];
    [parser setURLScheme:@"breve"];
    
    [parser addHandlerForActionName:@"applyEffect"
                       handlerBlock:^BOOL(NSDictionary *parameters, NSString *source, SBRCallbackActionHandlerCompletionBlock completion) {
        NSLog(@"Action triggered with parameters: %@", parameters);
        
        // For two-way app communication, When you are ready to trigger the
        // callbacks provided by the external app, call the completion
        // block provided. This happens asynchronously for your to determine
        // when you are ready to make the callback. This callback can be omitted
        // if the action is not a two-way type action.
        completion(nil, nil, NO);
        
        // YES let's the parser know the action was handled, otherwise return NO
        return YES;
    }];
}

+ (void)handleOpenURL:(NSURL *)url
{
    [[SBRCallbackParser sharedParser] handleURL:url];
}

/*
 
 [scheme]://[host]/[action]?[x-callback parameters]&[action parameters]

 */

@end
