//
//  NewsViewController.m
//  Rubin
//
//  Created by user on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation NewsViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}

- (void) printInfo
{
    CGRect frame;
    //Вывод картинки
    if(self.imgUrl.length > 5)
    {
        NSData *data =  [NSData dataWithContentsOfURL:[NSURL URLWithString:self.imgUrl]];
        UIImage *image = [UIImage imageWithData: data];
        
        if(self.scrollView.frame.size.width < image.size.width)
            image = [UIImage imageWithData:data scale: 2];
        
        frame = CGRectMake( (self.scrollView.frame.size.width - image.size.width) / 2 , 0, image.size.width, image.size.height);
        self.imageView = [[UIImageView alloc] init];
        self.imageView.image = image;
        [self.imageView setFrame: frame];
        [self.scrollView addSubview: self.imageView];
    }
    
    //Вывод текста
    self.descText = [[UITextView alloc] init];
    [self.descText setText: self.someText];
    
    if(self.imgUrl.length > 5)
        frame = CGRectMake( 0, self.imageView.frame.size.height + 5, self.scrollView.frame.size.width, self.scrollView.frame.size.height - self.imageView.frame.size.height + 5);
    else
        frame = CGRectMake( 0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    
    [self.descText setFrame: frame];
    [self.descText setScrollEnabled: NO];
    [self.scrollView addSubview: self.descText];
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}
 
- (void)viewDidLoad 
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self printInfo];
    
    CGRect scrollViewFrame = self.scrollView.frame;
    scrollViewFrame.size.height = self.descText.frame.size.height + self.imageView.frame.size.height + 100;

    [self.scrollView setContentSize: scrollViewFrame.size];
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
