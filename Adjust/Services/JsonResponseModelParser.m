    //
    //  SongParser.m
    //  ObjectiveCSample
    //
    //  Created by Benoit PASQUIER on 23/05/2020.
    //  Copyright © 2020 Benoit PASQUIER. All rights reserved.
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
