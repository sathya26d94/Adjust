//
//  JsonResponseModel.m
//  Adjust
//
//  Created by Sathiyamoorthy on 21/11/2021.
//  Copyright © 2020 Sathiyamoorthy. All rights reserved.
//

#import "JsonResponseModel.h"

@implementation JsonResponseModel

- (instancetype)initWithID:(NSString*)iD seconds:(NSString*)seconds {
    self = [super init];
    if (self) {
        self.iD = iD;
        self.seconds = seconds;
    }
    return self;
}

@end
