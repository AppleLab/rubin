//
//  ShopDetailViewContollerViewController.h
//  Shop
//
//  Created by user on 19.08.13.
//  Copyright (c) 2013 Kiv1n. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopPurchaseViewController.h"

@interface ShopDetailViewContollerViewController : UIViewController

@property (strong, nonatomic) NSArray *itemDetailModel;
@property (strong, nonatomic) IBOutlet UILabel *itemLabel;
@property (strong, nonatomic) IBOutlet UILabel *itemID;
@property (strong, nonatomic) IBOutlet UILabel *itemCost;
@property (strong, nonatomic) IBOutlet UIImageView *itemImage;

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end
