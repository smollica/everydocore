//
//  MasterViewController.h
//  EveryDoCore
//
//  Created by Monica Mollica on 2016-03-30.
//  Copyright © 2016 Sergio Mollica. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end

