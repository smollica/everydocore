//
//  DetailViewController.h
//  EveryDoCore
//
//  Created by Monica Mollica on 2016-03-30.
//  Copyright © 2016 Sergio Mollica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) ToDoItem *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

