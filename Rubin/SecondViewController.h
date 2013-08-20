//
//  SecondViewController.h
//  Rubin
//
//  Created by Ramil Garaev on 12.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UIWebViewDelegate>{
    UIButton *back;
	UIButton *forward;
}
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property(nonatomic,retain)IBOutlet UIButton *back;
@property(nonatomic,retain)IBOutlet UIButton *forward;
- (IBAction)backButtonPressed:(id)sender;
- (IBAction)forwardButtonPressed:(id)sender;


@end
