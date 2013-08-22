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
    bool successfulUploadToServer;
    NSInteger scroll_value;
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
        successfulUploadToServer = [ShopUtils simpleSendingPurshaceToServer:totalInfoFromPurchase];
    }
}

// Метод обмена между PurchaseView и CompletePurchaseView, отправляется true если все поля заполнены, true если отправка на сервер удачная
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"CompletePurchase"]) {
        ShopCompletePurchaseViewController *completePurchaseViewController = [segue destinationViewController];
        completePurchaseViewController.successfulPurhase = successfulPurchase;
        completePurchaseViewController.successfulUploadToServer = successfulUploadToServer;
    }
    
}

// Часть, которая отвечает за изменение экрана при вводе с клавиатуры

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
    if (([textFieldComment isFirstResponder] || [textFieldPhone isFirstResponder] || [textFieldAddress isFirstResponder] || [textFieldName isFirstResponder]) && self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (!([textFieldComment isFirstResponder] || [textFieldPhone isFirstResponder] || [textFieldAddress isFirstResponder] || [textFieldName isFirstResponder]) && self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

// Закрывает клавиатуру после нажататия на экран
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
    
    if (([textFieldComment isFirstResponder] || [textFieldPhone isFirstResponder] || [textFieldAddress isFirstResponder] || [textFieldName isFirstResponder]) && self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (!([textFieldComment isFirstResponder] || [textFieldPhone isFirstResponder] || [textFieldAddress isFirstResponder] || [textFieldName isFirstResponder]) && self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(IBAction)BeginEditing:(UITextField *)sender
{
    if  (self.view.frame.origin.y >= 0 && ([textFieldComment isFirstResponder] || [textFieldPhone isFirstResponder] || [textFieldAddress isFirstResponder] || [textFieldName isFirstResponder])){
        scroll_value = 140;
        [self setViewMovedUp:YES];
    } else if (self.view.frame.origin.y < 0 &&  !([textFieldComment isFirstResponder] || [textFieldPhone isFirstResponder] || [textFieldAddress isFirstResponder] || [textFieldName isFirstResponder])){
        [self setViewMovedUp:NO];
    }
}

-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        rect.origin.y -= scroll_value;
        rect.size.height += scroll_value;
    }
    else
    {
        rect.origin.y += scroll_value;
        rect.size.height -= scroll_value;
    }
    self.view.frame = rect;
    [UIView commitAnimations];
}

- (void)keyboardWillShow:(NSNotification *)notif
{
    if (([textFieldComment isFirstResponder] || [textFieldPhone isFirstResponder] || [textFieldAddress isFirstResponder] || [textFieldName isFirstResponder]) && self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    } else if (!([textFieldComment isFirstResponder] || [textFieldPhone isFirstResponder] || [textFieldAddress isFirstResponder] || [textFieldName isFirstResponder]) && self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:self.view.window];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}


@end
