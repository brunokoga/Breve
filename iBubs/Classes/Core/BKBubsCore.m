//
//  BKBubsCore.m
//  iBubs
//
//  Created by Bruno Koga on 11/14/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBubsCore.h"
@interface BKBubsCore ()
@property (strong, nonatomic) NSArray *normalLetters;
@property (strong, nonatomic) NSArray *bubbleLetters;
@end

@implementation BKBubsCore

+ (id)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (NSArray *)normalLetters
{
    if (!_normalLetters) {
        NSString *normalLettersString = @"a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9";
        NSArray *normalLetters = [normalLettersString componentsSeparatedByString:@" "];
        self.normalLetters = normalLetters;
    }
    
    return self.normalLetters;
}

- (NSArray *)bubbleLetters
{
    if (!_bubbleLetters) {
        NSString *bubbleLettersString = @"ⓐ ⓑ ⓒ ⓓ ⓔ ⓕ ⓖ ⓗ ⓘ ⓙ ⓚ ⓛ ⓜ ⓝ ⓞ ⓟ ⓠ ⓡ ⓢ ⓣ ⓤ ⓥ ⓦ ⓧ ⓨ ⓩ Ⓐ Ⓑ Ⓒ Ⓓ Ⓔ Ⓕ Ⓖ Ⓗ Ⓘ Ⓙ Ⓚ Ⓛ Ⓜ Ⓝ Ⓞ Ⓟ Ⓠ Ⓡ Ⓢ Ⓣ Ⓤ Ⓥ Ⓦ Ⓧ Ⓨ Ⓩ ⓪ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨";
        NSArray *bubbleLetters = [bubbleLettersString componentsSeparatedByString:@" "];
        self.bubbleLetters = bubbleLetters;
    }
    return self.bubbleLetters;
}

- (NSString *)convertFromNormalToBubble:(NSString *)string
{
    return [self convertString:string
                   fromMapping:[self normalLetters]
                     toMapping:[self bubbleLetters]];
    
}

- (NSString *)convertFromBubbleToNormal:(NSString *)string
{
    return [self convertString:string
                   fromMapping:[self bubbleLetters]
                     toMapping:[self normalLetters]];
}

- (NSString *)convertString:(NSString *)string
                fromMapping:(NSArray *)fromMapping
                  toMapping:(NSArray *)toMapping
{
    NSMutableString *mutableString = [[NSMutableString alloc] initWithString:string];
    for (int i = 0; i < [fromMapping count]; i++)
    {
        [mutableString replaceOccurrencesOfString:fromMapping[i]
                              withString:toMapping[i]
                                 options:0
                                   range:NSMakeRange(0, [mutableString length])];
        
    }
    return [mutableString copy];
}

@end
