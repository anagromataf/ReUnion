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
    self.dataManager = [[RUDataManager alloc] initWithModel:[ReUnionModel managedObjectModel]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
