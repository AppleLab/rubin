//
//  AboutTeamViewController.m
//  Rubin
//
//  Created by user on 22.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "AboutTeamViewController.h"

@interface AboutTeamViewController ()

@end

@implementation AboutTeamViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)openUrlOfficialSite:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.rubin-kazan.ru/rubin/index.php"]];

}

-(IBAction)openUrlFunSite:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.fcrubin.ru"]];
}

@end
