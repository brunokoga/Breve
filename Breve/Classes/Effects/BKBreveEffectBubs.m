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
@synthesize toMapping = _toMapping;
@synthesize fromMapping = _fromMapping;

- (NSArray *)lettersArray
{
    if (!_lettersArray) {
        NSString *lettersString = @"ⓐ ⓑ ⓒ ⓓ ⓔ ⓕ ⓖ ⓗ ⓘ ⓙ ⓚ ⓛ ⓜ ⓝ ⓞ ⓟ ⓠ ⓡ ⓢ ⓣ ⓤ ⓥ ⓦ ⓧ ⓨ ⓩ Ⓐ Ⓑ Ⓒ Ⓓ Ⓔ Ⓕ Ⓖ Ⓗ Ⓘ Ⓙ Ⓚ Ⓛ Ⓜ Ⓝ Ⓞ Ⓟ Ⓠ Ⓡ Ⓢ Ⓣ Ⓤ Ⓥ Ⓦ Ⓧ Ⓨ Ⓩ ⓪ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨";
        _lettersArray = [lettersString componentsSeparatedByString:@" "];
    }
    return _lettersArray;
}

- (NSDictionary *)toMapping {
  if (!_toMapping) {
    _toMapping = @{
        @"a" : @"ⓐ",
        @"b" : @"ⓑ",
        @"c" : @"ⓒ",
        @"d" : @"ⓓ",
        @"e" : @"ⓔ",
        @"f" : @"ⓕ",
        @"g" : @"ⓖ",
        @"h" : @"ⓗ",
        @"i" : @"ⓘ",
        @"j" : @"ⓙ",
        @"k" : @"ⓚ",
        @"l" : @"ⓛ",
        @"m" : @"ⓜ",
        @"n" : @"ⓝ",
        @"o" : @"ⓞ",
        @"p" : @"ⓟ",
        @"q" : @"ⓠ",
        @"r" : @"ⓡ",
        @"s" : @"ⓢ",
        @"t" : @"ⓣ",
        @"u" : @"ⓤ",
        @"v" : @"ⓥ",
        @"w" : @"ⓦ",
        @"x" : @"ⓧ",
        @"y" : @"ⓨ",
        @"z" : @"ⓩ",
        @"A" : @"Ⓐ",
        @"B" : @"Ⓑ",
        @"C" : @"Ⓒ",
        @"D" : @"Ⓓ",
        @"E" : @"Ⓔ",
        @"F" : @"Ⓕ",
        @"G" : @"Ⓖ",
        @"H" : @"Ⓗ",
        @"I" : @"Ⓘ",
        @"J" : @"Ⓙ",
        @"K" : @"Ⓚ",
        @"L" : @"Ⓛ",
        @"M" : @"Ⓜ",
        @"N" : @"Ⓝ",
        @"O" : @"Ⓞ",
        @"P" : @"Ⓟ",
        @"Q" : @"Ⓠ",
        @"R" : @"Ⓡ",
        @"S" : @"Ⓢ",
        @"T" : @"Ⓣ",
        @"U" : @"Ⓤ",
        @"V" : @"Ⓥ",
        @"W" : @"Ⓦ",
        @"X" : @"Ⓧ",
        @"Y" : @"Ⓨ",
        @"Z" : @"Ⓩ",
        @"0" : @"⓪",
        @"1" : @"①",
        @"2" : @"②",
        @"3" : @"③",
        @"4" : @"④",
        @"5" : @"⑤",
        @"6" : @"⑥",
        @"7" : @"⑦",
        @"8" : @"⑧",
        @"9" : @"⑨",
    };
  }
  return _toMapping;
}

- (NSDictionary *)fromMapping {
  if (!_fromMapping) {
  }
  return _fromMapping;
}

- (NSString *)effectName
{
    return @"Bubs";
}

- (NSString *)effectDisplayName
{
  return @"";
}

@end
