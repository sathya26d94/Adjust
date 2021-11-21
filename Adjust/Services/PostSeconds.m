//
//  SongFetcher.m
//  ObjectiveCSample
//
//  Created by Benoit PASQUIER on 23/05/2020.
//  Copyright © 2020 Benoit PASQUIER. All rights reserved.
//

#import "PostSeconds.h"

@interface PostSeconds()

@property (nonatomic, strong) id<JsonResponseModelParserProtocol> parser;
@property (nonatomic, strong) id<NetworkServiceProtocol> networkClient;

@end

@implementation PostSeconds

- (instancetype)initWithClient:(nonnull id<NetworkServiceProtocol>)client parser:(id<JsonResponseModelParserProtocol>)parser {
    self = [super init];
    if (self) {
        self.parser = parser;
        self.networkClient = client;
    }
    return self;
}

- (void)postSeconds:(NSString*)seconds withSuccess:(void (^)(JsonResponseModel *responseModel))successCompletion error:(void (^)(NSError *error))errorCompletion {
    
    __weak PostSeconds *weakSelf = self;
    void (^networksResponse)(NSData *) = ^(NSData *data){
        [weakSelf.parser parseJsonResponseModel:data withSuccess:successCompletion error:errorCompletion];
    };
    
    // TODO: improve error handling at each steps
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSDictionary *requestParams =  [[NSDictionary alloc] initWithObjectsAndKeys: seconds, @"seconds", nil];
        [weakSelf.networkClient postSynchronousRequestParams:requestParams withSuccess:networksResponse error:errorCompletion];
    });
}

@end
