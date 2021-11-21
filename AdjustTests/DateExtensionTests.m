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

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testGetCurrentSecond {
    NSTimeInterval mockTimeInterval = 1637505027;
    NSString *expectedSeconds = @"27";
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970: mockTimeInterval];
    
    NSString *seconds = [date getCurrentSecond];
    XCTAssert([expectedSeconds isEqualToString:seconds], @"getCurrentSecond Failed");
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
