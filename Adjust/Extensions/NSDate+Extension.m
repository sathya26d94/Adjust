//
//  NSDate+Extension.m
//  Adjust
//
//  Created by Sathiyamoorthy on 21/11/21.
//

#import <Foundation/Foundation.h>
#import "NSDate+Extension.h"

@implementation NSDate(Extension)

- (NSString*)getCurrentSecond {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitSecond) fromDate: self];
    return [[NSNumber alloc] initWithInteger: [components second]].stringValue;
}

@end
