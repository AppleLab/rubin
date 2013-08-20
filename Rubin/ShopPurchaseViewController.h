//
//  ShopPurchaseViewController.h
//  Shop
//
//  Created by user on 20.08.13.
//  Copyright (c) 2013 Kiv1n. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopUtils.h"
#import "ShopCompletePurchaseViewController.h"

@interface ShopPurchaseViewController : UIViewController

@property (nonatomic, retain) NSString *itemID; //ID получаем от  DetailView
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentControlTypeOfPayment;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentControlTypeOfShipping;
@property (nonatomic, retain) IBOutlet UITextField *textFieldAddress;
@property (nonatomic, retain) IBOutlet UITextField *textFieldName;
@property (nonatomic, retain) IBOutlet UITextField *textFieldPhone;
@property (nonatomic, retain) IBOutlet UITextField *textFieldComment;

-(IBAction)btnBuyClick;

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end
