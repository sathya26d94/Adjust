//
//  PostSecondsProtocol.h
//  ObjectiveCSample
//
//  Created by Benoit PASQUIER on 23/05/2020.
//  Copyright © 2020 Benoit PASQUIER. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JsonResponseModel.h"

@protocol PostSecondsProtocol <NSObject>

- (void)postSeconds:(NSString*)seconds withSuccess:(void (^)(JsonResponseModel *responseModel))successCompletion error:(void (^)(NSError *error))errorCompletion;

@end

@protocol JsonResponseModelParserProtocol <NSObject>

- (void)parseJsonResponseModel:(NSData *)data withSuccess:(void (^)(JsonResponseModel *responseModel))successCompletion error:(void (^)(NSError *error))errorCompletion;

@end

