//
//  RUSessionTransformer.m
//  ReUnion
//
//  Created by Tobias Kräntzer on 27.03.14.
//  Copyright (c) 2014 Tobias Kräntzer. All rights reserved.
//

#import "RUDayTransformer.h"

#import "RUSessionTransformer.h"

@interface RUSessionTransformer ()
+ (NSDateFormatter *)dateFormatter;
@end

@implementation RUSessionTransformer

+ (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    });
    return formatter;
}

- (id)transformedValueForAttribute:(NSAttributeDescription *)attributeDescription
                          ofObject:(id)object
                          userInfo:(NSDictionary *)userInfo
{
    if (attributeDescription.attributeType == NSDateAttributeType) {
        NSString *dateString = [object valueForKey:attributeDescription.name];
        if (dateString) {
            return [[[self class] dateFormatter] dateFromString:dateString];
        } else {
            return nil;
        }
    } else if ([attributeDescription.name isEqualToString:@"url"]) {
        NSString *urlString = [object valueForKey:@"url"];
        if ([urlString isKindOfClass:[NSString class]] && urlString) {
            return [NSURL URLWithString:urlString];
        } else {
            return nil;
        }
    } else {
        return [super transformedValueForAttribute:attributeDescription
                                          ofObject:object
                                          userInfo:userInfo];
    }
}

- (id)transformedValueForRelationship:(NSRelationshipDescription *)relationshipDescription
                             ofObject:(id)object
                             userInfo:(NSDictionary *)userInfo
{
    Class _class = nil;
    
    NSString *entityName = relationshipDescription.destinationEntity.name;
    if ([entityName isEqualToString:@"Day"]) {
        _class = [RUDayTransformer class];
    }
    
    if (_class) {
        return [super transformedValueForRelationship:relationshipDescription
                                             ofObject:object
                                             userInfo:userInfo
                                                class:_class];
    } else {
        return [super transformedValueForRelationship:relationshipDescription
                                             ofObject:object
                                             userInfo:userInfo];
    }
}

@end
