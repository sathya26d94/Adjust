//
//  NetworkService.m
//  Adjust
//
//  Created by Sathiyamoorthy on 21/11/2021.
//  Copyright © 2020 Sathiyamoorthy. All rights reserved.
//

#import "NetworkService.h"

@interface NetworkService()


@end

@implementation NetworkService

- (instancetype)init {
    self = [super init];
    return self;
}

- (void)postSynchronousRequestParams:(NSDictionary *)requestParams withSuccess:(void (^)(NSData *))successCompletion error:(void (^)(NSError *))errorCompletion {
    
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject: requestParams options:0 error: nil];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: [NSURL URLWithString:
                                                                         @"https://jsonplaceholder.typicode.com/posts"]
                                                           cachePolicy: NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval: 60.0
                                    ];
    
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody:postData];
    
    NSURLSession * session = [NSURLSession sharedSession];
    
    NSURLSessionTask * task = [session dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            errorCompletion(error);
            return;
        }
        
        if (!data) {
            // TODO create error
            errorCompletion(nil);
            return;
        }
        
        successCompletion(data);
        dispatch_semaphore_signal(sem);
    }];
    
    [task resume];
    
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
}

@end
