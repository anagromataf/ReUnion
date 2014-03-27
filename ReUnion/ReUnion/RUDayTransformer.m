//
//  RUDayTransformer.m
//  ReUnion
//
//  Created by Tobias Kräntzer on 27.03.14.
//  Copyright (c) 2014 Tobias Kräntzer. All rights reserved.
//

#import "RUDayTransformer.h"

@interface RUDayTransformer ()
+ (NSDateFormatter *)dateFormatter;
@end

@implementation RUDayTransformer

+ (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
    });
    return formatter;
}

- (id)transformedValueForAttribute:(NSAttributeDescription *)attributeDescription ofObject:(id)object userInfo:(NSDictionary *)userInfo
{
    if ([attributeDescription.name isEqualToString:@"date"]) {
        NSString *dateString = [object valueForKey:@"date"];
        if (dateString) {
            return [[[self class] dateFormatter] dateFromString:dateString];
        } else {
            return nil;
        }
    } else {
        return [super transformedValueForAttribute:attributeDescription
                                          ofObject:object
                                          userInfo:userInfo];
    }
}

@end
