//
//  BKBubsCore.m
//  iBubs
//
//  Created by Bruno Koga on 11/14/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveCore.h"
@interface BKBreveCore ()
@property (strong, nonatomic) NSArray *normalLetters;
@property (strong, nonatomic) NSArray *bubsLetters;
@end

@implementation BKBreveCore

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
        _normalLetters = normalLetters;
    }
    
    return _normalLetters;
}

- (NSArray *)bubsLetters
{
    if (!_bubsLetters) {
        NSString *bubbleLettersString = @"ⓐ ⓑ ⓒ ⓓ ⓔ ⓕ ⓖ ⓗ ⓘ ⓙ ⓚ ⓛ ⓜ ⓝ ⓞ ⓟ ⓠ ⓡ ⓢ ⓣ ⓤ ⓥ ⓦ ⓧ ⓨ ⓩ Ⓐ Ⓑ Ⓒ Ⓓ Ⓔ Ⓕ Ⓖ Ⓗ Ⓘ Ⓙ Ⓚ Ⓛ Ⓜ Ⓝ Ⓞ Ⓟ Ⓠ Ⓡ Ⓢ Ⓣ Ⓤ Ⓥ Ⓦ Ⓧ Ⓨ Ⓩ ⓪ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨";
        NSArray *bubsLetters = [bubbleLettersString componentsSeparatedByString:@" "];
        _bubsLetters = bubsLetters;
    }
    return _bubsLetters;
}

- (NSString *)convertFromNormalToBubs:(NSString *)string
{
    return [self convertString:string
                   fromMapping:[self normalLetters]
                     toMapping:[self bubsLetters]];
    
}

- (NSString *)convertFromBubsToNormal:(NSString *)string
{
    return [self convertString:string
                   fromMapping:[self bubsLetters]
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
