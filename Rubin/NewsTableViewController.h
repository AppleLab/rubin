//
//  NewsTableViewController.h
//  Rubin
//
//  Created by user on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewsViewController;

@interface NewsTableViewController : UITableViewController <NSXMLParserDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NewsViewController *newsViewController;

@end
