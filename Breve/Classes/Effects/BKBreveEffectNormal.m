//
//  BKBreveEffectNormal.m
//  Breve
//
//  Created by Bruno Koga on 12/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveEffectNormal.h"

@implementation BKBreveEffectNormal

@synthesize lettersArray = _lettersArray;

- (NSArray *)lettersArray
{
    if (!_lettersArray) {
        NSString *lettersString = @"a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9";
        _lettersArray = [lettersString componentsSeparatedByString:@" "];
    }
    return _lettersArray;
}

- (NSString *)effectName {
    return @"Normal";
}

- (NSString *)effectDisplayName {
  return @"Normal";
}

@end
