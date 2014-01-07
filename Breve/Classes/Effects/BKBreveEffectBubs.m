//
//  BKBreveEffectBubs.m
//  Breve
//
//  Created by Bruno Koga on 12/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveEffectBubs.h"

@implementation BKBreveEffectBubs
@synthesize lettersArray = _lettersArray;

- (NSArray *)lettersArray
{
    if (!_lettersArray) {
        NSString *lettersString = @"ⓐ ⓑ ⓒ ⓓ ⓔ ⓕ ⓖ ⓗ ⓘ ⓙ ⓚ ⓛ ⓜ ⓝ ⓞ ⓟ ⓠ ⓡ ⓢ ⓣ ⓤ ⓥ ⓦ ⓧ ⓨ ⓩ Ⓐ Ⓑ Ⓒ Ⓓ Ⓔ Ⓕ Ⓖ Ⓗ Ⓘ Ⓙ Ⓚ Ⓛ Ⓜ Ⓝ Ⓞ Ⓟ Ⓠ Ⓡ Ⓢ Ⓣ Ⓤ Ⓥ Ⓦ Ⓧ Ⓨ Ⓩ ⓪ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨";
        _lettersArray = [lettersString componentsSeparatedByString:@" "];
    }
    return _lettersArray;
}

- (NSString *)effectName
{
    return @"Bubs";
}

@end
