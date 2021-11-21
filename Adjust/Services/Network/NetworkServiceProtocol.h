//
//  NetworkServiceProtocol.h
//  ObjectiveCSample
//
//  Created by Benoit PASQUIER on 23/05/2020.
//  Copyright © 2020 Benoit PASQUIER. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef NetworkServiceProtocol_h
#define NetworkServiceProtocol_h

@protocol NetworkServiceProtocol <NSObject>

- (void)postSynchronousRequestParams:(NSDictionary *)requestParams withSuccess:(void (^)(NSData *))successCompletion error:(void (^)(NSError *))errorCompletion;

@end


#endif /* NetworkServiceProtocol_h */
