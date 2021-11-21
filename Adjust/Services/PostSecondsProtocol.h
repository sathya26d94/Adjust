//
//  PostSecondsProtocol.h
//  Adjust
//
//  Created by Sathiyamoorthy on 21/11/2021.
//  Copyright © 2020 Sathiyamoorthy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JsonResponseModel.h"

@protocol PostSecondsProtocol <NSObject>

- (void)postSeconds:(NSString*)seconds withSuccess:(void (^)(JsonResponseModel *responseModel))successCompletion error:(void (^)(NSError *error))errorCompletion;

@end

@protocol JsonResponseModelParserProtocol <NSObject>

- (void)parseJsonResponseModel:(NSData *)data withSuccess:(void (^)(JsonResponseModel *responseModel))successCompletion error:(void (^)(NSError *error))errorCompletion;

@end

