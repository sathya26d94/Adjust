//
//  NetworkServiceProtocol.h
//  Adjust
//
//  Created by Sathiyamoorthy on 21/11/2021.
//  Copyright © 2020 Sathiyamoorthy. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef NetworkServiceProtocol_h
#define NetworkServiceProtocol_h

@protocol NetworkServiceProtocol <NSObject>

- (void)postSynchronousRequestParams:(NSDictionary *)requestParams withSuccess:(void (^)(NSData *))successCompletion error:(void (^)(NSError *))errorCompletion;

@end


#endif /* NetworkServiceProtocol_h */
