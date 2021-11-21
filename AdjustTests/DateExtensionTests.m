//
//  DateExtensionTests.m
//  AdjustTests
//
//  Created by Sathiyamoorthy on 19/11/21.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "NSDate+Extension.h"

@interface DateExtensionTests : XCTestCase

@end

@implementation DateExtensionTests

- (void)testGetCurrentSecond {
    NSTimeInterval mockTimeInterval = 1637505027;
    NSString *expectedSeconds = @"27";
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970: mockTimeInterval];
    
    NSString *seconds = [date getCurrentSecond];
    XCTAssert([expectedSeconds isEqualToString:seconds], @"getCurrentSecond Failed");
    
}

@end
