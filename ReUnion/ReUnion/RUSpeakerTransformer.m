//
//  RUSpeakerTransformer.m
//  ReUnion
//
//  Created by Tobias Kräntzer on 27.03.14.
//  Copyright (c) 2014 Tobias Kräntzer. All rights reserved.
//

#import "RUSpeakerTransformer.h"

@implementation RUSpeakerTransformer

- (id)transformedValueForRelationship:(NSRelationshipDescription *)relationshipDescription
                             ofObject:(id)object
                             userInfo:(NSDictionary *)userInfo
{
    if ([relationshipDescription.name isEqual:@"event"]) {
        NSString *eventId = [object valueForKey:@"event"];
        NSDictionary *event = @{@"id":eventId};
        return [[MTObjectTransformer alloc] initWithObject:event
                                                    entity:relationshipDescription.destinationEntity
                                                  userInfo:userInfo];
    } else {
        return [super transformedValueForRelationship:relationshipDescription
                                             ofObject:object
                                             userInfo:userInfo];
    }
}

@end
