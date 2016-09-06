//
//  DetailViewController.h
//  test4pda
//
//  Created by Alexey Golygin on 06/09/16.
//  Copyright © 2016 Alexey Golygin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface DetailViewController : UIViewController

@property (copy, nonatomic) NSString *url;
@property (strong, nonatomic) WKWebView *webView;
@property (strong, nonatomic) id detailItem;

@end

