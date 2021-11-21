//
//  JsonResponseModelParserTests.m
//  AdjustTests
//
//  Created by Sathiyamoorthy on 19/11/21.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "JsonResponseModelParser.h"

@interface JsonResponseModelParserTests : XCTestCase

@end

@implementation JsonResponseModelParserTests

- (void)testParser {
    NSString *mockID = @"101";
    NSString *mockSeconds = @"42";
    
    NSDictionary *mockDict = [[NSDictionary alloc] initWithObjectsAndKeys: mockID, @"id", mockSeconds, @"seconds", nil];
    
    NSData *mockData = [NSJSONSerialization dataWithJSONObject: mockDict
                                                       options: NSJSONWritingPrettyPrinted
                                                         error: nil];
    JsonResponseModelParser *parser = [[JsonResponseModelParser alloc] init];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Handler called"];
    
    [parser parseJsonResponseModel: mockData withSuccess: ^(JsonResponseModel *responseModel) {
        XCTAssert([responseModel.iD isEqualToString: mockID], @"Parser failed");
        XCTAssert([responseModel.seconds isEqualToString: mockSeconds], @"Parser failed");
        [expectation fulfill];
    } error:^(NSError *error) {
        //TODO Test failure block
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:nil];
}

@end
