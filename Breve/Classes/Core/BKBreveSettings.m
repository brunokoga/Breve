//
//  BKBubsSettings.m
//  iBubs
//
//  Created by Bruno Koga on 11/15/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import "BKBreveSettings.h"

@implementation BKBreveSettings

+ (instancetype)generalSettings;
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
        [sharedInstance loadSettings];
    });
    return sharedInstance;
}

- (void)loadSettings
{
  NSString *firstRunKey = @"BKBreveDidRunBefore";
  BOOL firstTime = ![self boolForKey:firstRunKey];
  if (firstTime) {
    [self setBOOL:YES forKey:firstRunKey];
    [self setRemoveAccentsAndDiacritics:YES];
    [self setAutocorrection:YES];
  }
}

#pragma mark - Helpers

- (void)setInteger:(NSInteger)value forKey:(NSString *)key
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setInteger:value
                           forKey:key];
    [standardUserDefaults synchronize];
}

- (NSInteger)integerForKey:(NSString *)key
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    return [standardUserDefaults integerForKey:key];
}

- (void)setBOOL:(BOOL)boolValue forKey:(NSString *)key
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setBool:boolValue
                           forKey:key];
    [standardUserDefaults synchronize];
}

- (BOOL)boolForKey:(NSString *)key
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    return [standardUserDefaults boolForKey:key];
}

static NSString * const kBreveSettingsAutocorrection = @"kBreveSettingsAutocorrection";

- (BOOL)autocorrection
{
    return [self boolForKey:kBreveSettingsAutocorrection];
}

- (void)setAutocorrection:(BOOL)autocorrection
{
    [self setBOOL:autocorrection forKey:kBreveSettingsAutocorrection];
}

static NSString * const kBreveSettingsAutocapitalization = @"kBreveSettingsAutocapitalization";

- (BOOL)autocapitalization
{
    return [self boolForKey:kBreveSettingsAutocapitalization];
}

- (void)setAutocapitalization:(BOOL)autocapitalization
{
    [self setBOOL:autocapitalization forKey:kBreveSettingsAutocapitalization];
}

static NSString * const kBreveSettingsSpellChecking = @"kBreveSettingsSpellChecking";

- (BOOL)spellChecking
{
    return [self boolForKey:kBreveSettingsSpellChecking];
}

- (void)setSpellChecking:(BOOL)spellChecking
{
    [self setBOOL:spellChecking forKey:kBreveSettingsSpellChecking];
}

static NSString * const kBreveSettingsRemoveAccentsAndDiacritics = @"kBreveSettingsRemoveAccentsAndDiacritics";

- (BOOL)removeAccentsAndDiacritics
{
    return [self boolForKey:kBreveSettingsRemoveAccentsAndDiacritics];
}

- (void)setRemoveAccentsAndDiacritics:(BOOL)removeAccentsAndDiacritics
{
    [self setBOOL:removeAccentsAndDiacritics forKey:kBreveSettingsRemoveAccentsAndDiacritics];
}

static NSString * const kBreveSettingsTheme = @"kBreveSettingsTheme";

- (BKBreveTheme)theme
{
    return (BKBreveTheme)[self integerForKey:kBreveSettingsTheme];
}

- (void)setTheme:(BKBreveTheme)theme
{
    [self setInteger:theme forKey:kBreveSettingsTheme];
    [self applyTheme];
}

- (void)applyTheme
{
    [BKBreveThemes applyTheme:[self theme]];
}

@end
