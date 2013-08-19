//
//  NewsViewController.h
//  Rubin
//
//  Created by user on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (copy,nonatomic) NSString* someText;
@property (strong, nonatomic) IBOutlet UITextView *descText; 

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
