//
//  ThirdViewController.m
//  Rubin
//
//  Created by user on 15.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

@synthesize scrollView;

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
    [self.scrollView setContentSize:CGSizeMake(320.0, 1250.0)];
    [self.scrollView setScrollEnabled:YES];
    //TODO:something
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RubinInformation.jpg"]];
    imageView.frame = CGRectMake(0, 0, 320, 1250);
    [self.scrollView addSubview: imageView];
    // Do any additional setup after loading the view.
    
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
