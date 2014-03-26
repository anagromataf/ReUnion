//
//  ReUnionModel.m
//  ReUnionModel
//
//  Created by Tobias Kräntzer on 26.03.14.
//  Copyright (c) 2014 Tobias Kräntzer. All rights reserved.
//

#import "ReUnionModel.h"

@implementation ReUnionModel

+ (NSManagedObjectModel *)managedObjectModel
{
    static NSManagedObjectModel *model;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ReUnionModel"
                                                  withExtension:@"momd"];
        model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    });
    return model;
}

@end
