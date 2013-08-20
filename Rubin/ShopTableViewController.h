//
//  ShopTableViewController.h
//  Shop
//
//  Created by user on 19.08.13.
//  Copyright (c) 2013 Kiv1n. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopTableViewCell.h"
#import "ShopUtils.h"
#import "ShopDetailViewContollerViewController.h"

@interface ShopTableViewController : UITableViewController

@property (nonatomic, retain) NSArray *itemsForShop;

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end
