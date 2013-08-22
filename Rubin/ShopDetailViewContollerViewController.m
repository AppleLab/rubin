//
//  ShopDetailViewContollerViewController.m
//  Shop
//
//  Created by user on 19.08.13.
//  Copyright (c) 2013 Kiv1n. All rights reserved.
//

#import "ShopDetailViewContollerViewController.h"

@interface ShopDetailViewContollerViewController ()

@end

@implementation ShopDetailViewContollerViewController

@synthesize itemDetailModel;
@synthesize itemLabel = _itemLabel;
@synthesize itemID = _itemID;
@synthesize itemCost = _itemCost;
@synthesize itemImage = _itemImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = @"Покупка";
    
    self.itemLabel.text = [itemDetailModel objectAtIndex:0];
    self.itemID.text = [itemDetailModel objectAtIndex:1];
    self.itemImage.image = [itemDetailModel objectAtIndex:2];
    self.itemCost.text = [NSString stringWithFormat:@"%@%@", [itemDetailModel objectAtIndex:3], @" руб."];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Метод обмена между DetailView и PurchaseView, отправляется itemID
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowItemPurchase"]) {
        
        ShopPurchaseViewController *purchaseViewController = [segue destinationViewController];
        
        purchaseViewController.itemID = [itemDetailModel objectAtIndex:1];
    }
    
}

@end
