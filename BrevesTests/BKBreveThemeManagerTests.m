//
//  BKBreveThemeManagerTests.m
//  Breve
//
//  Created by Bruno Koga on 3/13/14.
//  Copyright (c) 2014 Bruno Koga. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BKThemeManager.h"
#import "BKBreveThemeAbstractClass.h"

#pragma mark - Themes to test Theme Manager accessors
#import "BKBreveBasicTheme.h"
#import "BKBreveDarkTheme.h"
#import "BKBrevePowerGirlTheme.h"

@interface BKBreveThemeManagerTests : XCTestCase

@end

@implementation BKBreveThemeManagerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testManager
{
  id<BKTheme> theme = [BKBreveBasicTheme new];
  [BKThemeManager setTheme:theme];
  XCTAssertEqualObjects(theme, [BKThemeManager theme], @"Both Themes should be equal");
  
  theme = [BKBrevePowerGirlTheme new];
  [BKThemeManager setTheme:theme];
  XCTAssertEqualObjects(theme, [BKThemeManager theme], @"Both Themes should be equal");
  
  theme = [BKBreveDarkTheme new];
  [BKThemeManager setTheme:theme];
  XCTAssertEqualObjects(theme, [BKThemeManager theme], @"Both Themes should be equal");
  
  theme = nil;
  [BKThemeManager setTheme:theme];
  XCTAssertNil([BKThemeManager theme], @"Theme should be nil");

  //resetting the theme
  theme = [BKBreveDarkTheme new];
  [BKThemeManager setTheme:theme];
  XCTAssertEqualObjects(theme, [BKThemeManager theme], @"Both Themes should be equal");
}

@end
