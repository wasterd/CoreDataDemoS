//
//  Book+CoreDataProperties.h
//  CoreDataDemo
//
//  Created by mac on 16/4/19.
//  Copyright © 2016年 liuyl. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface Book (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *bookName;
@property (nullable, nonatomic, retain) Auther *auther;

@end

NS_ASSUME_NONNULL_END
