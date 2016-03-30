//
//  ToDoItem+CoreDataProperties.h
//  EveryDoCore
//
//  Created by Monica Mollica on 2016-03-30.
//  Copyright © 2016 Sergio Mollica. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ToDoItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDoItem (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *isComplete;
@property (nullable, nonatomic, retain) NSString *todoDescription;
@property (nullable, nonatomic, retain) NSNumber *todoPriority;
@property (nullable, nonatomic, retain) NSString *todoTitle;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END
