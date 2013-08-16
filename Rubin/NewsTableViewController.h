//
//  NewsTableViewController.h
//  Rubin
//
//  Created by user on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewController : UITableViewController <UITableViewDelegate,UITableViewDataSource> {
    
    NSArray* dataArray;
    
}

@property(nonatomic,retain) NSArray *dataArray;
@end
