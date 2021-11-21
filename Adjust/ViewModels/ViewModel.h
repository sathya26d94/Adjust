//
//  ViewModel.h
//  Adjust
//
//  Created by Sathiyamoorthy on 21/11/2021.
//  Copyright © 2020 Sathiyamoorthy. All rights reserved.
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
