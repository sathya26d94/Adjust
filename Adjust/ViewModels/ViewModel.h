//
//  ViewModel.h
//  ObjectiveCSample
//
//  Created by Benoit PASQUIER on 23/05/2020.
//  Copyright © 2020 Benoit PASQUIER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkServiceProtocol.h"
#import "PostSecondsProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewModel : NSObject

- (instancetype)initWithClient: (nonnull id<NetworkServiceProtocol>)client
                        parser: (id<JsonResponseModelParserProtocol>)parser;
- (void)onTapExtractDataButton;

@end

NS_ASSUME_NONNULL_END
