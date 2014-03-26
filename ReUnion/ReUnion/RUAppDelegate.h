//
//  RUAppDelegate.h
//  ReUnion
//
//  Created by Tobias Kräntzer on 26.03.14.
//  Copyright (c) 2014 Tobias Kräntzer. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RUDataManager.h"

@interface RUAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, readonly) RUDataManager *dataManager;

@end
