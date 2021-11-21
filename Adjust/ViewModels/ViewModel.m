//
//  ViewModel.m
//  Adjust
//
//  Created by Sathiyamoorthy on 21/11/2021.
//  Copyright © 2020 Sathiyamoorthy. All rights reserved.
//

#import "ViewModel.h"

#import "PostSeconds.h"
#import "NSDate+Extension.h"

@interface ViewModel()

@property (nonatomic, strong) id<PostSecondsProtocol> postSeconds;
@property (nonatomic, strong) NSMutableDictionary *entryMap;

//TODO: Replace NSMutableArray with Linked List, inorder to improve performance while dequeue
@property (atomic, strong)NSMutableArray *requestQueue;

@end

@implementation ViewModel

static NSString *const keyRequestQueue = @"requestQueue";
static NSString *const KeyEntryMap = @"entryMap";

#pragma mark - Object lifecycle methods

- (instancetype)initWithClient:(nonnull id<NetworkServiceProtocol>)client
                        parser:(id<JsonResponseModelParserProtocol>)parser {
    self = [super init];
    if (self) {
        self.postSeconds = [[PostSeconds alloc] initWithClient:client
                                                        parser:parser
                            ];
        [self initOldData];
        [self processRequestsInQueue];
    }
    return self;
}


#pragma mark - Public methods
- (void)onTapExtractDataButton {
    NSString *second = [[NSDate date] getCurrentSecond];
    if (self.entryMap[second]) {
        NSLog(@"Dupicate");
    } else {
        self.entryMap[second] = [NSNumber numberWithBool: YES];
        [self.requestQueue addObject: second];
        [self savePropertiesInUserDefaults];
        [self processRequestsInQueue];
    }
}

#pragma mark - private methods
- (void)initOldData {
    id oldEntryMap = [[NSUserDefaults standardUserDefaults] objectForKey: KeyEntryMap];
    if (oldEntryMap == nil) {
        self.entryMap = [NSMutableDictionary dictionary];
    } else {
        self.entryMap = [oldEntryMap mutableCopy];
    }
    
    id oldInProgressArray = [[NSUserDefaults standardUserDefaults] objectForKey: keyRequestQueue];
    if (oldInProgressArray == nil) {
        self.requestQueue = [NSMutableArray array];
    } else {
        self.requestQueue = [oldInProgressArray mutableCopy];
    }
        
}

- (void)processRequestsInQueue {
    dispatch_async
    (dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSString *firstItem = [self requestQueue].firstObject;
        if (firstItem != nil) {
            [self postSeconds: firstItem];
        }
    });
}

- (void)postSeconds:(NSString*)seconds {
    [self.postSeconds postSeconds: seconds withSuccess:^(JsonResponseModel *responseModel) {
        NSLog(@"id: %@", responseModel.iD);
        NSLog(@"seconds: %@", responseModel.seconds);
        [self.requestQueue removeObjectAtIndex: 0];
        [self savePropertiesInUserDefaults];
        [self processRequestsInQueue];
    } error:^(NSError *error) {
            // TODO: Handle error cases
        [self processRequestsInQueue];
    }];
    
}

- (void)savePropertiesInUserDefaults {
    [[NSUserDefaults standardUserDefaults] setObject:self.entryMap forKey:KeyEntryMap];
    [[NSUserDefaults standardUserDefaults] setObject:self.requestQueue forKey:keyRequestQueue];
}

@end
