//
//  BKBasicThemeTests.m
//  Breve
//
//  Created by Bruno Koga on 3/13/14.
//  Copyright (c) 2014 Bruno Koga. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BKBreveBasicTheme.h"

@interface BKBasicThemeTests : XCTestCase
@property (strong, nonatomic) BKBreveBasicTheme *theme;

@end

@implementation BKBasicThemeTests

- (void)setUp
{
    [super setUp];
  self.theme = [BKBreveBasicTheme new];
}

- (void)tearDown
{
  self.theme = nil;
  [super tearDown];
}

- (void)testTheme
{
  XCTAssertEqual(UIStatusBarStyleDefault, [self.theme statusBarStyle], @"Wrong Status Bar Style");
  
  UIColor *expectedBackgroundColor = [UIColor whiteColor];
  XCTAssertEqualObjects(expectedBackgroundColor, [self.theme backgroundColor], @"Wrong Color");
  
  UIColor *expectedForegroundColor = [UIColor blackColor];
    XCTAssertEqualObjects(expectedForegroundColor, [self.theme foregroundColor], @"Wrong Color");
  
  UIColor *expectedTintColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
    XCTAssertEqualObjects(expectedTintColor, [self.theme tintColor], @"Wrong Color");
  
  UIColor *expectedBackgroundAlternativeColor = [UIColor colorWithRed:233.0f/255.0f
                                                                green:233.0f/255.0f
                                                                 blue:233.0f/255.0f
                                                                alpha:1.0f];
    XCTAssertEqualObjects(expectedBackgroundAlternativeColor, [self.theme backgroundAlternativeColor], @"Wrong Color");
}

@end
