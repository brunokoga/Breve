//
//  BKPowerGirlThemeTests.m
//  Breve
//
//  Created by Bruno Koga on 3/13/14.
//  Copyright (c) 2014 Bruno Koga. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BKBrevePowerGirlTheme.h"

@interface BKPowerGirlThemeTests : XCTestCase

@property (strong, nonatomic) BKBrevePowerGirlTheme *theme;

@end

@implementation BKPowerGirlThemeTests

- (void)setUp
{
  [super setUp];
  self.theme = [BKBrevePowerGirlTheme new];
}

- (void)tearDown
{
  self.theme = nil;
  [super tearDown];
}

- (void)testTheme
{
  XCTAssertEqual(UIStatusBarStyleLightContent, [self.theme statusBarStyle], @"Wrong Status Bar Style");
  
  UIColor *expectedBackgroundColor = [UIColor colorWithRed:255.0/255.0
                                                     green:12.0/255.0
                                                      blue:121.0/255.0
                                                     alpha:1.0];
  XCTAssertEqualObjects(expectedBackgroundColor, [self.theme backgroundColor], @"Wrong Color");
  
  UIColor *expectedForegroundColor = [UIColor whiteColor];
  XCTAssertEqualObjects(expectedForegroundColor, [self.theme foregroundColor], @"Wrong Color");
  
  UIColor *expectedTintColor = [UIColor whiteColor];
  XCTAssertEqualObjects(expectedTintColor, [self.theme tintColor], @"Wrong Color");
  
  UIColor *expectedBackgroundAlternativeColor = [UIColor colorWithRed:242.0/255.0
                                                                green:12.0/255.0
                                                                 blue:88.0/255.0
                                                                alpha:1.0];
  XCTAssertEqualObjects(expectedBackgroundAlternativeColor, [self.theme backgroundAlternativeColor], @"Wrong Color");
}

@end
