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
  
  UIColor *expectedBackgroundColor = [UIColor colorWithRed:51.0f/255.0f
                                                     green:51.0f/255.0f
                                                      blue:51.0f/255.0f
                                                     alpha:1.0f];
  XCTAssertEqualObjects(expectedBackgroundColor, [self.theme backgroundColor], @"Wrong Color");
  
  UIColor *expectedForegroundColor = [UIColor colorWithRed:153.0f/255.0f
                                                     green:153.0f/255.0f
                                                      blue:153.0f/255.0f
                                                     alpha:1.0f];
  XCTAssertEqualObjects(expectedForegroundColor, [self.theme foregroundColor], @"Wrong Color");
  
  UIColor *expectedTintColor = [UIColor whiteColor];  XCTAssertEqualObjects(expectedTintColor, [self.theme tintColor], @"Wrong Color");
  
  UIColor *expectedBackgroundAlternativeColor = [UIColor colorWithRed:77.0f/255.0f
                                                                green:77.0f/255.0f
                                                                 blue:77.0f/255.0f
                                                                alpha:1.0f];
  XCTAssertEqualObjects(expectedBackgroundAlternativeColor, [self.theme backgroundAlternativeColor], @"Wrong Color");
}

@end
