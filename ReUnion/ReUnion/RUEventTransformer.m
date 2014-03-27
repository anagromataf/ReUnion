//
//  RUEventTransformer.m
//  ReUnion
//
//  Created by Tobias Kräntzer on 27.03.14.
//  Copyright (c) 2014 Tobias Kräntzer. All rights reserved.
//

#import "RUSpeakerTransformer.h"
#import "RUSessionTransformer.h"
#import "RUDayTransformer.h"
#import "RUFormatTransformer.h"
#import "RULevelTransformer.h"
#import "RULinkTransformer.h"
#import "RULocationTransformer.h"
#import "RUTrackTransformer.h"

#import "RUEventTransformer.h"

NSString * const RUEventTransformerEventIDKey = @"RUEventTransformerEventIDKey";

@implementation RUEventTransformer

- (id)transformedValueForAttribute:(NSAttributeDescription *)attributeDescription
                          ofObject:(id)object
                          userInfo:(NSDictionary *)userInfo
{
    if ([attributeDescription.name isEqualToString:@"id"]) {
        NSString *eventId = [userInfo valueForKey:RUEventTransformerEventIDKey];
        if (eventId) {
            return eventId;
        }
    }
    
    return [super transformedValueForAttribute:attributeDescription ofObject:object userInfo:userInfo];
}

- (id)transformedValueForRelationship:(NSRelationshipDescription *)relationshipDescription
                             ofObject:(id)object
                             userInfo:(NSDictionary *)userInfo
{
    Class _class = nil;
    
    NSString *entityName = relationshipDescription.destinationEntity.name;
    if ([entityName isEqualToString:@"Speaker"]) {
        _class = [RUSpeakerTransformer class];
    } else if ([entityName isEqualToString:@"Session"]) {
        _class = [RUSessionTransformer class];
    } else if ([entityName isEqualToString:@"Day"]) {
        _class = [RUDayTransformer class];
    } else if ([entityName isEqualToString:@"Format"]) {
        _class = [RUFormatTransformer class];
    } else if ([entityName isEqualToString:@"Level"]) {
        _class = [RULevelTransformer class];
    } else if ([entityName isEqualToString:@"Link"]) {
        _class = [RULinkTransformer class];
    } else if ([entityName isEqualToString:@"Location"]) {
        _class = [RULocationTransformer class];
    } else if ([entityName isEqualToString:@"Track"]) {
        _class = [RUTrackTransformer class];
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
