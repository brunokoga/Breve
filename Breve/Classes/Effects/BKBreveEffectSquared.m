//
// Created by Bruno Koga on 3/27/14.
// Copyright (c) 2014 Bruno Koga. All rights reserved.
//

#import "BKBreveEffectSquared.h"


@implementation BKBreveEffectSquared

@synthesize toMapping = _toMapping;
@synthesize fromMapping = _fromMapping;

- (NSDictionary *)toMapping {
  if (!_toMapping) {

    _toMapping = @{
        @"a" : @"🄰",
        @"b" : @"🄱",
        @"c" : @"🄲",
        @"d" : @"🄳",
        @"e" : @"🄴",
        @"f" : @"🄵",
        @"g" : @"🄶",
        @"h" : @"🄷",
        @"i" : @"🄸",
        @"j" : @"🄹",
        @"k" : @"🄺",
        @"l" : @"🄻",
        @"m" : @"🄼",
        @"n" : @"🄽",
        @"o" : @"🄾",
        @"p" : @"🄿",
        @"q" : @"🅀",
        @"r" : @"🅁",
        @"s" : @"🅂",
        @"t" : @"🅃",
        @"u" : @"🅄",
        @"v" : @"🅅",
        @"w" : @"🅆",
        @"x" : @"🅇",
        @"y" : @"🅈",
        @"z" : @"🅉",
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
  return @"Squared";
}

- (NSString *)effectDisplayName
{
  return @"🅂🅀🅄🄰🅁🄴🄳";
}

@end
