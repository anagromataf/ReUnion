//
//  RUDataManager.h
//  ReUnion
//
//  Created by Tobias Kräntzer on 26.03.14.
//  Copyright (c) 2014 Tobias Kräntzer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface RUDataManager : NSObject

#pragma mark Life-cycle
- (id)initWithModel:(NSManagedObjectModel *)model URL:(NSURL *)storeURL;

#pragma mark CoreData Stack
@property (nonatomic, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end
