//
//  ShopUtils.m
//  Shop
//
//  Created by user on 19.08.13.
//  Copyright (c) 2013 Kiv1n. All rights reserved.
//

#import "ShopUtils.h"

@implementation ShopUtils

// необходима для тестирование сервера
+ (BOOL) currentServerIsAvailable {
    return NO;
}

+ (NSArray *) simpleItemsForShop
{
    NSString *nameForItem1 = @"Футболка / Рубин";
    UIImage *imageForItem1 = [UIImage imageNamed:@"item1.png"];
    NSDictionary *item1 = [NSDictionary dictionaryWithObjectsAndKeys:nameForItem1, @"name", imageForItem1, @"image", @"683", @"cost", @"1", @"id",nil];
    
    NSString *nameForItem2 = @"Футболка / Вместе Мы - Рубин";
    UIImage *imageForItem2 = [UIImage imageNamed:@"item2.png"];
    NSDictionary *item2 = [NSDictionary dictionaryWithObjectsAndKeys:nameForItem2, @"name", imageForItem2, @"image", @"823", @"cost", @"2", @"id", nil];
    
    NSString *nameForItem3 = @"Коврик / Рубин";
    UIImage *imageForItem3 = [UIImage imageNamed:@"item3.png"];
    NSDictionary *item3 = [NSDictionary dictionaryWithObjectsAndKeys:nameForItem3, @"name", imageForItem3, @"image", @"123", @"cost", @"3", @"id", nil];
    
    NSString *nameForItem4 = @"Футболка / Rubin";
    UIImage *imageForItem4 = [UIImage imageNamed:@"item4.png"];
    NSDictionary *item4 = [NSDictionary dictionaryWithObjectsAndKeys:nameForItem4, @"name", imageForItem4, @"image", @"893", @"cost", @"4", @"id", nil];
    
    NSString *nameForItem5 = @"Реглан / Вперед Рубин";
    UIImage *imageForItem5 = [UIImage imageNamed:@"item5.png"];
    NSDictionary *item5 = [NSDictionary dictionaryWithObjectsAndKeys:nameForItem5, @"name", imageForItem5, @"image", @"1068", @"cost", @"5", @"id", nil];
    
    NSString *nameForItem6 = @"Пивной бокал / Rubin";
    UIImage *imageForItem6 = [UIImage imageNamed:@"item6.png"];
    NSDictionary *item6 = [NSDictionary dictionaryWithObjectsAndKeys:nameForItem6, @"name", imageForItem6, @"image", @"578", @"cost", @"6", @"id", nil];
    
    NSString *nameForItem7 = @"Брелок / Вперед Рубин";
    UIImage *imageForItem7 = [UIImage imageNamed:@"item7.png"];
    NSDictionary *item7 = [NSDictionary dictionaryWithObjectsAndKeys:nameForItem7, @"name", imageForItem7, @"image", @"158", @"cost", @"7", @"id", nil];
    
    NSString *nameForItem8 = @"Футболка / Rubin";
    UIImage *imageForItem8 = [UIImage imageNamed:@"item8.png"];
    NSDictionary *item8 = [NSDictionary dictionaryWithObjectsAndKeys:nameForItem8, @"name", imageForItem8, @"image", @"683", @"cost", @"8", @"id", nil];
    
    NSString *nameForItem9 = @"Футболка / Эмблема Рубина";
    UIImage *imageForItem9 = [UIImage imageNamed:@"item9.png"];
    NSDictionary *item9 = [NSDictionary dictionaryWithObjectsAndKeys:nameForItem9, @"name", imageForItem9, @"image", @"823", @"cost", @"9", @"id", nil];
    
    NSArray *currentArray = [NSArray arrayWithObjects:item1, item2, item3, item4, item5, item6, item7, item8, item9, nil];
    
    return currentArray;
}

// отправляет информацию от текущем заказе purchaseInfo в виде NSString на сервер
// отправляемая строка имеет вид "id, name, address, payment, shipping, phone, comment"
// название "name.txt"
+ (BOOL)simpleSendingPurshaceToServer:(NSDictionary *)purchaseInfo
{
    // подготовка данных перед отправкой на сервер
    NSMutableString *mutablePurchaseInfo = [NSMutableString stringWithCapacity:100];
    [mutablePurchaseInfo appendString:[purchaseInfo objectForKey:@"id"]];
    [mutablePurchaseInfo appendString:@";"];
    [mutablePurchaseInfo appendString:[purchaseInfo objectForKey:@"name"]];
    [mutablePurchaseInfo appendString:@";"];
    [mutablePurchaseInfo appendString:[purchaseInfo objectForKey:@"address"]];
    [mutablePurchaseInfo appendString:@";"];
    [mutablePurchaseInfo appendString:[purchaseInfo objectForKey:@"payment"]];
    [mutablePurchaseInfo appendString:@";"];
    [mutablePurchaseInfo appendString:[purchaseInfo objectForKey:@"shipping"]];
    [mutablePurchaseInfo appendString:@";"];
    [mutablePurchaseInfo appendString:[purchaseInfo objectForKey:@"phone"]];
    [mutablePurchaseInfo appendString:@";"];
    [mutablePurchaseInfo appendString:[purchaseInfo objectForKey:@"comment"]];
    [mutablePurchaseInfo appendString:@";"];
    
    NSString *stringPurchaseInfo = [NSString stringWithString:mutablePurchaseInfo];
    NSData *data = [stringPurchaseInfo dataUsingEncoding:NSUTF8StringEncoding];
    
    // отправка на сервер
    NSString *fileName = [NSString stringWithFormat:@"%@%@", [purchaseInfo objectForKey:@"name"], @".txt" ];
    bool flag = [self uploadDataToServer:data filename:fileName];
    
    return flag;
}

// Отправка NSData файла на сервер
+ (BOOL)uploadDataToServer:(NSData *)uploadData filename:(NSString *)filename
{
    
    if ([self currentServerIsAvailable]) {
        NSString *urlString = @"http://192.168.25.127/index.php";
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%@\"\r\n",filename]] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:uploadData]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [request setHTTPBody:body];
        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
        
        return ([returnString isEqualToString:@"OK"]);
    } else {
        return NO;
    }
}


@end
