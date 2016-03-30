//
//  CoreDataStack.m
//  EveryDoCore
//
//  Created by Monica Mollica on 2016-03-30.
//  Copyright © 2016 Sergio Mollica. All rights reserved.
//

#import "CoreDataStack.h"

@interface CoreDataStack ()

@property (nonatomic, strong) NSManagedObjectModel *mom;
@property (nonatomic, strong) NSPersistentStoreCoordinator *psc;

@end

@implementation CoreDataStack


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        NSURL *momdUrl = [[NSBundle mainBundle] URLForResource:@"ToDoModel" withExtension:@"momd"];
        // get momd url
        
        
        _mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:momdUrl];
        // init MOM (as a private property)
        
        
        
        _psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_mom];
        // init PSC (as a private property)
        
        
        NSArray *documentsDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSString *docPath = [documentsDirectories firstObject];
        
        NSString *dbPath = [docPath stringByAppendingPathComponent:@"ToDo.db"];
        
        NSURL *dbUrl = [NSURL fileURLWithPath:dbPath];
        // get data store url NSSearchPathFor...
        
        NSError *pscError = nil;
        
        if (![_psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:dbUrl options:nil error:&pscError]) {
            
            NSLog(@"Error creating persistant store %@", pscError);
        }
        // add a NSSQLiteStoreType PS to the PSC
        
        
        _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        // init a MOC (as a public property)
        
        
        _context.persistentStoreCoordinator = _psc;
        // set the MOCs PSC
        
    }
    return self;
}

@end
