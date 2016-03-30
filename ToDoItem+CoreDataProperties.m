//
//  ToDoItem+CoreDataProperties.m
//  EveryDoCore
//
//  Created by Monica Mollica on 2016-03-30.
//  Copyright © 2016 Sergio Mollica. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ToDoItem+CoreDataProperties.h"

@implementation ToDoItem (CoreDataProperties)

@dynamic isComplete;
@dynamic todoDescription;
@dynamic todoPriority;
@dynamic todoTitle;
@dynamic user;

@end
