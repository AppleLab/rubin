//
//  ShopCompletePurchaseViewController.m
//  Shop
//
//  Created by user on 20.08.13.
//  Copyright (c) 2013 Kiv1n. All rights reserved.
//

#import "ShopCompletePurchaseViewController.h"

@interface ShopCompletePurchaseViewController ()

@end

@implementation ShopCompletePurchaseViewController

@synthesize successfulPurhase;
@synthesize successfulUploadToServer;
@synthesize label1;
@synthesize label2;

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
    if (successfulPurhase) {
        if (successfulUploadToServer) {
            self.navigationItem.hidesBackButton = YES;
            label1.text = @"Спасибо";
            label2.text = @"за покупку";
        } else {
            self.navigationItem.hidesBackButton = YES;
            label1.text = @"Извините";
            label2.text = @"сервер не доступен";
        }
    } else {
        label1.text = @"Ошибка";
        label2.text = @"Вы заполнили не все данные";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
