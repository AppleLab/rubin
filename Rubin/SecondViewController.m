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

@synthesize webView;
@synthesize back;
@synthesize forward;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL* url = [Core getForumURL];
    
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
     
    [webView loadRequest:request];
    [webView setScalesPageToFit:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonPressed:(id)sender {
    [webView goBack];
}

- (IBAction)forwardButtonPressed:(id)sender {
    [webView goForward];
}

- (void)webViewDidFinishLoad:(UIWebView *)thisWebView
{
    
	//stop the activity indicator when done loading
    
    //canGoBack and canGoForward are properties which indicate if there is
    //any forward or backward history
	if(thisWebView.canGoBack == YES)
	{
		back.enabled = YES;
		back.highlighted = YES;
	}
	if(thisWebView.canGoForward == YES)
	{
		forward.enabled = YES;
		forward.highlighted = YES;
	}
	
}
@end
