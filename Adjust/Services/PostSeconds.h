//
//  PostSeconds.h
//  Adjust
//
//  Created by Sathiyamoorthy on 21/11/2021.
//  Copyright © 2020 Sathiyamoorthy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostSecondsProtocol.h"
#import "NetworkServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostSeconds : NSObject<PostSecondsProtocol>

- (instancetype)initWithClient:(nonnull id<NetworkServiceProtocol>)client parser:(id<JsonResponseModelParserProtocol>)parser;

@end

NS_ASSUME_NONNULL_END
