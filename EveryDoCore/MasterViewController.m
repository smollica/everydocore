//
//  MasterViewController.m
//  EveryDoCore
//
//  Created by Monica Mollica on 2016-03-30.
//  Copyright © 2016 Sergio Mollica. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CoreDataStack.h"
#import "ToDoItem.h"
#import "TodoTableViewCell.h"
#import "InsertViewController.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@property (nonatomic) CoreDataStack *stack;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stack = [[CoreDataStack alloc] init];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"ToDoItem"];
    
    self.objects = [[self.stack.context executeFetchRequest:request error:NULL] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    
    [self performSegueWithIdentifier:@"showInsert" sender:self];

}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDoItem *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

- (IBAction)unwindFromInsertViewController:(UIStoryboardSegue *)unwindSegue {
    ToDoItem *newToDo = [NSEntityDescription insertNewObjectForEntityForName:@"ToDoItem" inManagedObjectContext:self.stack.context];
    InsertViewController *controller = (InsertViewController *)[unwindSegue sourceViewController];
    newToDo.todoTitle = controller.titleTextView.text;
    newToDo.todoDescription = controller.descriptionTextView.text;
    newToDo.todoPriority = [[NSNumber alloc] initWithInteger:controller.priorityTextView.text.integerValue];
    [self.objects insertObject:newToDo atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.stack.context save:NULL];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todoCell" forIndexPath:indexPath];
    ToDoItem *toDo = self.objects[indexPath.row];
    cell.titleLabel.text = toDo.todoTitle;
    cell.todoDescriptionLabel.text = toDo.todoDescription;
    cell.priorityLabel.text = [NSString stringWithFormat:@"%@", toDo.todoPriority];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        ToDoItem *todo = [self.objects objectAtIndex:indexPath.row];
        [self.stack.context deleteObject:todo];
        [self.stack.context save:NULL];
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
