//
//  Song.m
//  ObjectiveCSample
//
//  Created by Benoit PASQUIER on 23/05/2020.
//  Copyright © 2020 Benoit PASQUIER. All rights reserved.
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
