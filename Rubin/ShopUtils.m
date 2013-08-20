//
//  ShopUtils.m
//  Shop
//
//  Created by user on 19.08.13.
//  Copyright (c) 2013 Kiv1n. All rights reserved.
//

#import "ShopUtils.h"

@implementation ShopUtils

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
    
    NSArray *currentArray = [NSArray arrayWithObjects:item1, item2, item3, item4, item5, item6, nil];
    return currentArray;
}

+ (void)simpleSendingPurshaceToServer:(NSDictionary *)purchaseInfo
{
    NSLog(@"%@",@"Loooooogs");
    NSLog(@"%@",[purchaseInfo objectForKey:@"id"]);
    NSLog(@"%@",[purchaseInfo objectForKey:@"payment"]);
    NSLog(@"%@",[purchaseInfo objectForKey:@"shipping"]);
    NSLog(@"%@",[purchaseInfo objectForKey:@"address"]);
    NSLog(@"%@",[purchaseInfo objectForKey:@"name"]);
    NSLog(@"%@",[purchaseInfo objectForKey:@"phone"]);
    NSLog(@"%@",[purchaseInfo objectForKey:@"comment"]);
}

@end
