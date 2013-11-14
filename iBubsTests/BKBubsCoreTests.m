//
//  BKBubsCoreTests.m
//  iBubs
//
//  Created by Bruno Koga on 11/14/13.
//  Copyright (c) 2013 Bruno Koga. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BKBubsCore.h"

@interface BKBubsCoreTests : XCTestCase

@end

@implementation BKBubsCoreTests

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

- (void)testNormalToBubs
{
    NSString *original;
    NSString *expected;
    NSString *bubs;
    
    original = @"Klebao Vida Loka";
    bubs = [[BKBubsCore sharedInstance] convertFromNormalToBubs:original];
    expected = @"Ⓚⓛⓔⓑⓐⓞ Ⓥⓘⓓⓐ Ⓛⓞⓚⓐ";
    
    XCTAssertEqualObjects(bubs, expected, @"Deu ruim...");

}

- (void)testBubsToNormal
{
    NSString *original;
    NSString *expected;
    NSString *bubs;
    
    original = @"Ⓚⓛⓔⓑⓐⓞ Ⓥⓘⓓⓐ Ⓛⓞⓚⓐ";
    bubs = [[BKBubsCore sharedInstance] convertFromBubsToNormal:original];
    expected = @"Klebao Vida Loka";
    
    XCTAssertEqualObjects(bubs, expected, @"Deu ruim...");
    
}
@end
