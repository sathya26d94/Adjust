//
//  SongFetcher.h
//  ObjectiveCSample
//
//  Created by Benoit PASQUIER on 23/05/2020.
//  Copyright © 2020 Benoit PASQUIER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostSecondsProtocol.h"
#import "NetworkServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostSeconds : NSObject<PostSecondsProtocol>

- (instancetype)initWithClient:(nonnull id<NetworkServiceProtocol>)client parser:(id<JsonResponseModelParserProtocol>)parser;

@end

NS_ASSUME_NONNULL_END
