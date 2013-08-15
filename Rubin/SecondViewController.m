//
//  SecondViewController.m
//  Rubin
//
//  Created by Ramil Garaev on 12.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "SecondViewController.h"
#import "Core.h"

@interface SecondViewController ()

@end
@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL* url = [Core getForumURL];
    
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
     
    [self.webView loadRequest:request];
    [self.webView setScalesPageToFit:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
