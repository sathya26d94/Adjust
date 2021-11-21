//
//  ViewModelTests.m
//  AdjustTest
//
//  Created by Sathiyamoorthy on 19/11/21.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "ViewModel.h"
#import "MockSuccessNetworkService.h"
#import "JsonResponseModelParser.h"

@interface ViewModelTests : XCTestCase
@property (nonatomic, strong) ViewModel * viewModel;
@end

@implementation ViewModelTests

- (void)setUp {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    self.viewModel = [[ViewModel alloc] initWithClient: [[MockSuccessNetworkService alloc] init]
                                            parser: [[JsonResponseModelParser alloc] init]
                  ];
}

- (void)tearDown {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testPostSeconds {
    
}

- (void)testPerformanceExample {
        // This is an example of a performance test case.
    [self measureBlock:^{
            // Put the code you want to measure the time of here.
    }];
}

- (void)resetData {
//    self.viewModel.entry
}

@end
