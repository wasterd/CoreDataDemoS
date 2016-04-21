//
//  Auther+CoreDataProperties.h
//  CoreDataDemo
//
//  Created by mac on 16/4/19.
//  Copyright © 2016年 liuyl. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Auther.h"

NS_ASSUME_NONNULL_BEGIN

@interface Auther (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSManagedObject *book;

@end

NS_ASSUME_NONNULL_END
