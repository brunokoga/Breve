//
//  BKBreveEffectManager.m
//  Breve
//
//  Created by Bruno Koga on 12/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveEffectManager.h"
#import "BKBreveSettings.h"
#import "NSString+AccentsAndDiacritics.h"

@interface BKBreveEffectManager ()
//cache. key = effect name; value = BKBreveEffects instance
@property (strong, nonatomic) NSMutableDictionary *effectsCache;

@end

@implementation BKBreveEffectManager

+ (id)sharedManager
{
    static dispatch_once_t once;
    static BKBreveEffectManager *sharedManager;
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
        sharedManager.effect = [BKBreveEffectNormal new];
        sharedManager.normalText = @"";
    });
    return sharedManager;
}

- (NSString *)convertString:(NSString *)string
                fromMapping:(NSDictionary *)fromMapping
                  toMapping:(NSDictionary *)toMapping
{
  NSMutableString *mutableString = [[NSMutableString alloc] initWithString:string];

  for (NSString *key in [toMapping allKeys]) {
    [mutableString replaceOccurrencesOfString:key
                                   withString:toMapping[key]
                                      options:0
                                        range:NSMakeRange(0, [mutableString length])];

  }
  return [mutableString copy];
}

- (NSString *)convertString:(NSString *)string
                   toEffect:(BKBreveEffect *)effect
{
  if ([effect isMemberOfClass:[BKBreveEffectNormal class]]) {
    return self.normalText;
  }
  self.normalText = string;
  BKBreveSettings *settings = [BKBreveSettings generalSettings];
  NSString *textToBeConverted = [string copy];
  if ([settings removeAccentsAndDiacritics])
  {
    textToBeConverted = [textToBeConverted stringByRemovingAccentsAndDiacritics];
  }
  BKBreveEffect *cachedToEffect = [self cacheAddOrReturnCachedEffect:effect];
  return [self convertString:textToBeConverted
                 fromMapping:nil
                   toMapping:cachedToEffect.toMapping];
}

- (NSString *)convertString:(NSString *)string
                 fromEffect:(BKBreveEffect *)fromEffect
                   toEffect:(BKBreveEffect *)toEffect
{
  BKBreveEffect *cachedToEffect = [self cacheAddOrReturnCachedEffect:toEffect];
  BKBreveEffect *cachedFromEffect = [self cacheAddOrReturnCachedEffect:fromEffect];

  return [self convertString:string
                 fromMapping:cachedFromEffect.fromMapping
                   toMapping:cachedToEffect.toMapping];
}

- (BKBreveEffect *)cacheAddOrReturnCachedEffect:(BKBreveEffect *)effect {
  BKBreveEffect *cachedEffect = self.effectsCache[effect.effectName];
  if (!cachedEffect) {
    cachedEffect = effect;
    [self.effectsCache addEntriesFromDictionary:@{effect.effectName : effect}];
  }
  return cachedEffect;
}

- (NSString *)convertString:(NSString *)string
         fromEffectWithName:(NSString *)fromEffectName
           toEffectWithName:(NSString *)toEffectName
{
  NSString *className = @"BKBreveEffect";
  NSString *fromEffectFirstLetterUppercase = [[fromEffectName substringToIndex:1] uppercaseString];
  NSString *fromClassName = [className stringByAppendingFormat:@"%@%@", fromEffectFirstLetterUppercase, [fromEffectName substringFromIndex:1]];

  NSString *toEffectFirstLetterUppercase = [[toEffectName substringToIndex:1] uppercaseString];
  NSString *toClassName = [className stringByAppendingFormat:@"%@%@", toEffectFirstLetterUppercase, [toEffectName substringFromIndex:1]];

  return [self convertString:string
                  fromEffect:[NSClassFromString(fromClassName) new]
                    toEffect:[NSClassFromString(toClassName) new]];
}

@end
