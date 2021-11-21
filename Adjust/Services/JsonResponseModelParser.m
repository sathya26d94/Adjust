//
//  JsonResponseModelParser.m
//  Adjust
//
//  Created by Sathiyamoorthy on 21/11/2021.
//  Copyright © 2020 Sathiyamoorthy. All rights reserved.
//

#import "JsonResponseModelParser.h"

@implementation JsonResponseModelParser

- (void)parseJsonResponseModel:(NSData *)data withSuccess:(void (^)(JsonResponseModel *responseModel))successCompletion error:(void (^)(NSError *error))errorCompletion {
    NSError *error;
    NSDictionary * jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if (!jsonDictionary || error) {            
        errorCompletion(error);
        return;
    }
        
    NSString *iD = [jsonDictionary objectForKey:@"id"];
    NSString *seconds = [jsonDictionary objectForKey:@"seconds"];
    
    JsonResponseModel *jsonResponseModel = [[JsonResponseModel alloc] initWithID:iD seconds:seconds];
        
    successCompletion(jsonResponseModel);
}

@end
