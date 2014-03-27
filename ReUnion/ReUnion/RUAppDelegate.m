//
//  RUAppDelegate.m
//  ReUnion
//
//  Created by Tobias Kräntzer on 26.03.14.
//  Copyright (c) 2014 Tobias Kräntzer. All rights reserved.
//

#import <ReUnionModel/ReUnionModel.h>

#import "RUEventTransformer.h"

#import "RUAppDelegate.h"

@interface RUAppDelegate ()
@property (nonatomic, readwrite, strong) RUDataManager *dataManager;
@property (nonatomic, readwrite, strong) RMMapper *resouceMapper;
@end

@implementation RUAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                       NSUserDomainMask, YES);
	NSString *storePath = [[documentDirectories objectAtIndex:0] stringByAppendingPathComponent:@"ReUnion.db"];
    NSAssert(storePath, @"Could not find the documents directoy.");
    
    NSURL *storeURL = [[NSURL alloc] initFileURLWithPath:storePath];
    self.dataManager = [[RUDataManager alloc] initWithModel:[ReUnionModel managedObjectModel]
                                                        URL:storeURL];
    
    
    self.resouceMapper = [[RMMapper alloc] initWithPersistentStoreCoordinator:self.dataManager.persistentStoreCoordinator];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        NSError *error = nil;
        
        NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"]];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:0
                                                               error:&error];
        
        NSAssert(json, [error localizedDescription]);
        
        NSEntityDescription *eventEntity = [[self.dataManager.managedObjectModel entitiesByName] objectForKey:@"Event"];
        RUEventTransformer *event = [[RUEventTransformer alloc] initWithObject:json
                                                                        entity:eventEntity
                                                                      userInfo:@{RUEventTransformerEventIDKey: @"rp13"}];
        
        
        NSLog(@"Begin Importing.");
        [self.resouceMapper insertOrUpdateResource:@[event]
                            usingEntityDescription:eventEntity
                                        completion:^(id<RMResult> result, NSError *error) {
                                            if (error) {
                                                NSLog(@"Failed Importing: %@", [error localizedDescription]);
                                            } else {
                                                NSLog(@"End Importing.");
                                            }
                                        }];
    });
    
    return YES;
}

@end
