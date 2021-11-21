//
//  Song.h
//  ObjectiveCSample
//
//  Created by Benoit PASQUIER on 23/05/2020.
//  Copyright © 2020 Benoit PASQUIER. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JsonResponseModel : NSObject

@property (nonatomic, strong) NSString * iD;
@property (nonatomic, strong) NSString * seconds;

- (instancetype)initWithID:(NSString*)iD seconds:(NSString*)seconds;

@end

NS_ASSUME_NONNULL_END
