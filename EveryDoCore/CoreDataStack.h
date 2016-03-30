//
//  CoreDataStack.h
//  EveryDoCore
//
//  Created by Monica Mollica on 2016-03-30.
//  Copyright © 2016 Sergio Mollica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataStack : NSObject

@property (nonatomic, strong) NSManagedObjectContext *context;

@end