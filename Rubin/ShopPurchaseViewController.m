//
//  ShopPurchaseViewController.m
//  Shop
//
//  Created by user on 20.08.13.
//  Copyright (c) 2013 Kiv1n. All rights reserved.
//

#import "ShopPurchaseViewController.h"

@interface ShopPurchaseViewController ()

@end

@implementation ShopPurchaseViewController {
    bool successfulPurchase;
}

@synthesize itemID;
@synthesize segmentControlTypeOfPayment;
@synthesize segmentControlTypeOfShipping;
@synthesize textFieldAddress;
@synthesize textFieldName;
@synthesize textFieldPhone;
@synthesize textFieldComment;


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
    
    self.title = @"Заказ";
    
    // Настраиваем оба segmentControl
    [segmentControlTypeOfPayment removeAllSegments];
    [segmentControlTypeOfPayment insertSegmentWithTitle:@"Наличными при доставке" atIndex:0 animated:false];
    
    [segmentControlTypeOfShipping removeAllSegments];
    [segmentControlTypeOfShipping insertSegmentWithTitle:@"Курьером" atIndex:0 animated:false];
    [segmentControlTypeOfShipping insertSegmentWithTitle:@"Почта России" atIndex:1 animated:false];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Обработка нажатия на кнопку "Купить"
- (IBAction)btnBuyClick
{
    // Готовим информацию о текущем заказе
    NSString *typeOfPayment = [NSString stringWithFormat:@"%i", segmentControlTypeOfPayment.selectedSegmentIndex];
    NSString *typeOfShipping = [NSString stringWithFormat:@"%i", segmentControlTypeOfShipping.selectedSegmentIndex];
    NSString *address = textFieldAddress.text;
    NSString *name = textFieldName.text;
    NSString *phone = textFieldPhone.text;
    NSString *comment = textFieldComment.text;
    
    // Проверяем "о заказе указана вся информация?"

    if ([typeOfPayment isEqualToString:@"-1"] || [typeOfShipping isEqualToString:@"-1"] || [address isEqualToString:@""] || [name isEqualToString:@""] || [phone isEqualToString:@""] || [comment isEqualToString:@""]) {
        successfulPurchase = false;
    } else {
        successfulPurchase = true;
    }
    
    if (successfulPurchase) {
        // Информация о текущем заказе
        NSDictionary *totalInfoFromPurchase = [NSDictionary dictionaryWithObjectsAndKeys:itemID, @"id", typeOfPayment, @"payment", typeOfShipping, @"shipping", address, @"address", name, @"name", phone, @"phone", comment, @"comment",nil];
        
        // Отправка заказа на сервер
        [ShopUtils simpleSendingPurshaceToServer:totalInfoFromPurchase];
    }
}

// Метод обмена между PurchaseView и CompletePurchaseView, отправляется true если все поля заполнены
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"CompletePurchase"]) {
        ShopCompletePurchaseViewController *completePurchaseViewController = [segue destinationViewController];
        completePurchaseViewController.successfulPurhase = successfulPurchase;
    }
    
}

// Закрывает клавиатуру после нажататия на экран
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

@end
