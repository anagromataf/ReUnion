//
//  RUAppDelegate.m
//  ReUnion
//
//  Created by Tobias Kräntzer on 26.03.14.
//  Copyright (c) 2014 Tobias Kräntzer. All rights reserved.
//

#import <ReUnionModel/ReUnionModel.h>

#import "RUAppDelegate.h"

@interface RUAppDelegate ()
@property (nonatomic, readwrite, strong) RUDataManager *dataManager;
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
    
    return YES;
}

@end
