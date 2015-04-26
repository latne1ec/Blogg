//
//  TableViewController.h
//  Blogg
//
//  Created by Evan Latner on 2/14/15.
//  Copyright (c) 2015 Evan Latner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlogPost.h"

@interface TableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *blogPosts;

@end
