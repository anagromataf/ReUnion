//
//  RUDataManager.m
//  ReUnion
//
//  Created by Tobias Kräntzer on 26.03.14.
//  Copyright (c) 2014 Tobias Kräntzer. All rights reserved.
//

#import "RUDataManager.h"

@implementation RUDataManager

#pragma mark Life-cycle

- (id)initWithModel:(NSManagedObjectModel *)model
{
    self = [super init];
    if (self) {
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    }
    return self;
}

#pragma mark CoreData Stack

- (NSManagedObjectModel *)managedObjectModel
{
    return self.persistentStoreCoordinator.managedObjectModel;
}

@end
