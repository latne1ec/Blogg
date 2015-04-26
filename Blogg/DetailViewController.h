//
//  DetailViewController.h
//  Blogg
//
//  Created by Evan Latner on 2/14/15.
//  Copyright (c) 2015 Evan Latner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) NSURL *blogPostUrl;


@end
