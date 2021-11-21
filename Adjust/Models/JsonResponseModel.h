//
//  JsonResponseModel.h
//  Adjust
//
//  Created by Sathiyamoorthy on 21/11/2021.
//  Copyright © 2020 Sathiyamoorthy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JsonResponseModel : NSObject

@property (nonatomic, strong) NSString * iD;
@property (nonatomic, strong) NSString * seconds;

- (instancetype)initWithID:(NSString*)iD seconds:(NSString*)seconds;

@end

NS_ASSUME_NONNULL_END
