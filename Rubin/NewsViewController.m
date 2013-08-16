//
//  NewsViewController.m
//  Rubin
//
//  Created by user on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

@synthesize newsText, string;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    newsText.text = string;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
