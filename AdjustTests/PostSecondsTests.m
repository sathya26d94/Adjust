//
//  PostSecondsTests.m
//  AdjustTest
//
//  Created by Sathiyamoorthy on 19/11/21.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "PostSeconds.h"
#import "MockSuccessNetworkService.h"
#import "JsonResponseModelParser.h"

@interface PostSecondsTests : XCTestCase

@end

@implementation PostSecondsTests

- (void)setUp {
        // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testPostSeconds {
    
    PostSeconds *postSeconds = [[PostSeconds alloc]
                                initWithClient: [[MockSuccessNetworkService alloc] init]
                                parser: [[JsonResponseModelParser alloc] init]
                                ];
    
    NSString *mockSeconds = @"42";
    XCTestExpectation *expectation = [self expectationWithDescription:@"Handler called"];
    
    [postSeconds postSeconds: mockSeconds withSuccess:^(JsonResponseModel *responseModel) {
        XCTAssert([responseModel.seconds isEqualToString: mockSeconds], @"Post failed");
        [expectation fulfill];
    } error:^(NSError *error) {
        //TODO Test failure block
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:nil];
}

- (void)testPerformanceExample {
        // This is an example of a performance test case.
    [self measureBlock:^{
            // Put the code you want to measure the time of here.
    }];
}

@end
