//
//  BKDarkThemeTests.m
//  Breve
//
//  Created by Bruno Koga on 3/13/14.
//  Copyright (c) 2014 Bruno Koga. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BKBreveDarkTheme.h"
@interface BKDarkThemeTests : XCTestCase
@property (strong, nonatomic) BKBreveDarkTheme *theme;
@end

@implementation BKDarkThemeTests

- (void)setUp
{
  [super setUp];
  self.theme = [BKBreveDarkTheme new];
}

- (void)tearDown
{
  self.theme = nil;
  [super tearDown];
}

- (void)testTheme
{
  XCTAssertEqual(UIStatusBarStyleLightContent, [self.theme statusBarStyle], @"Wrong Status Bar Style");
  
  UIColor *expectedBackgroundColor = [UIColor blackColor];
  XCTAssertEqualObjects(expectedBackgroundColor, [self.theme backgroundColor], @"Wrong Color");
  
  UIColor *expectedForegroundColor = [UIColor lightGrayColor];
  XCTAssertEqualObjects(expectedForegroundColor, [self.theme foregroundColor], @"Wrong Color");
  
  UIColor *expectedTintColor = [UIColor redColor];
  XCTAssertEqualObjects(expectedTintColor, [self.theme tintColor], @"Wrong Color");
  
  UIColor *expectedBackgroundAlternativeColor = [UIColor darkGrayColor];
  XCTAssertEqualObjects(expectedBackgroundAlternativeColor, [self.theme backgroundAlternativeColor], @"Wrong Color");
}

@end
