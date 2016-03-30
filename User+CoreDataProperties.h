//
//  User+CoreDataProperties.h
//  EveryDoCore
//
//  Created by Monica Mollica on 2016-03-30.
//  Copyright © 2016 Sergio Mollica. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<ToDoItem *> *toDoItems;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addToDoItemsObject:(ToDoItem *)value;
- (void)removeToDoItemsObject:(ToDoItem *)value;
- (void)addToDoItems:(NSSet<ToDoItem *> *)values;
- (void)removeToDoItems:(NSSet<ToDoItem *> *)values;

@end

NS_ASSUME_NONNULL_END
