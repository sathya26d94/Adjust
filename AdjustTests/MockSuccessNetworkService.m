//
//  NetworkService.m
//  ObjectiveCSample
//
//  Created by Benoit PASQUIER on 23/05/2020.
//  Copyright © 2020 Benoit PASQUIER. All rights reserved.
//

#import "MockSuccessNetworkService.h"

@interface MockSuccessNetworkService()


@end

@implementation MockSuccessNetworkService

- (instancetype)init {
    self = [super init];
    return self;
}

- (void)postSynchronousRequestParams:(NSDictionary *)requestParams withSuccess:(void (^)(NSData *))successCompletion error:(void (^)(NSError *))errorCompletion {
            
    NSString *mockID = @"101";
    NSString *mockSeconds = @"42";
    
    NSDictionary *mockDict = [[NSDictionary alloc] initWithObjectsAndKeys: mockID, @"id", mockSeconds, @"seconds", nil];
    
    NSData *mockData = [NSJSONSerialization dataWithJSONObject: mockDict
                                                       options: NSJSONWritingPrettyPrinted
                                                         error: nil];
    successCompletion(mockData);
            
}

@end
