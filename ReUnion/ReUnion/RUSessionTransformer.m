//
//  RUSessionTransformer.m
//  ReUnion
//
//  Created by Tobias Kräntzer on 27.03.14.
//  Copyright (c) 2014 Tobias Kräntzer. All rights reserved.
//

#import "RUDayTransformer.h"

#import "RUSessionTransformer.h"

@implementation RUSessionTransformer

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
