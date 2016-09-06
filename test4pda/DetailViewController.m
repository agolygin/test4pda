//
//  DetailViewController.m
//  test4pda
//
//  Created by Alexey Golygin on 06/09/16.
//  Copyright © 2016 Alexey Golygin. All rights reserved.
//

#import "DetailViewController.h"
#import "UIView+Constraints.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    
//         Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
//        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _webView = [[WKWebView alloc] initWithFrame:CGRectZero];
    [_webView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_webView];
    
    // add full screen constraints
    [self.view setConstrItem:_webView attr:NSLayoutAttributeWidth to:self.view attr:NSLayoutAttributeWidth mul:1];
    [self.view setConstrItem:_webView attr:NSLayoutAttributeHeight to:self.view attr:NSLayoutAttributeHeight mul:1];
    [self.view setConstrItem:_webView attr:NSLayoutAttributeCenterX to:self.view attr:NSLayoutAttributeCenterX mul:1];
    [self.view setConstrItem:_webView attr:NSLayoutAttributeTop to:self.view attr:NSLayoutAttributeTop mul:1];
    
    NSURL *myURL = [NSURL URLWithString: [self.url stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet]];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    [self.webView loadRequest:request];
    
//    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
