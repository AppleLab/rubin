//
//  ShopUtils.h
//  Shop
//
//  Created by user on 19.08.13.
//  Copyright (c) 2013 Kiv1n. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopUtils : NSObject

// Возвращает массив словарей, состоящий из item (товаров)
// Каждый item состоит из dictionary с полями: "name", "image", "cost", "id"
+ (NSArray *) simpleItemsForShop;

+ (void) simpleSendingPurshaceToServer: (NSDictionary *) purchaseInfo;

@end
