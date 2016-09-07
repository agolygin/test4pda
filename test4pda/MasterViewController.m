//
//  MasterViewController.m
//  test4pda
//
//  Created by Alexey Golygin on 06/09/16.
//  Copyright © 2016 Alexey Golygin. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Article.h"
#import "CustomTableViewCell.h"
#import "afnetworking/AFNetworking.h"
#import "TFHpple.h"
#import "Haneke.h"

#define TEST4PDA_API_BASE_URL @"http://4pda.ru/news"

@interface MasterViewController (){

    NSMutableArray *newsFeeds;
    HNKCacheFormat *hanekeFormat;
}

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    // register haneke cash format
    HNKCacheFormat *format = [[HNKCacheFormat alloc] initWithName:@"nhk_format_image"];
    [format setSize:CGSizeMake(200, 150)];
    [format setScaleMode:HNKScaleModeAspectFit];
    [format setCompressionQuality:0.75];
    [format setDiskCapacity:10 * 1024 * 1024];
    [[HNKCache sharedCache] registerFormat:format];

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [manager GET:TEST4PDA_API_BASE_URL parameters:NULL progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        TFHpple *newsParser = [TFHpple hppleWithHTMLData:(NSData *)responseObject];
        NSArray *nodes = [newsParser searchWithXPathQuery:@"//article[@class='post']"];
        
        newsFeeds = [[NSMutableArray alloc] initWithCapacity:[nodes count]];
        for(TFHppleElement *elem in nodes)
        {
            Article *a = [[Article alloc] initWithTFHppleElement:elem];
            [newsFeeds addObject:a];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [self.tableView reloadData];
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"An error occured in '%@': error[%ld] %@",
              NSStringFromSelector(_cmd), (long)error.code, error.localizedDescription);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Article *a = [newsFeeds objectAtIndex:indexPath.row];
        UINavigationController *nav = [segue destinationViewController];
        DetailViewController *det = (DetailViewController *)[nav topViewController];
        [det setUrl:a.url];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return newsFeeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];
    Article *a = [newsFeeds objectAtIndex:indexPath.row];
    cell.titleLabel.text = a.title;
    cell.descriptionTextView.text = a.descr;
    
    // get doctor image from cache - haneke will download if not present
    [cell.titleImageView setHnk_cacheFormat:hanekeFormat];
    [cell.titleImageView hnk_setImageFromURL:[NSURL URLWithString:a.image] placeholder:nil];

//    [cell.titleImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:a.image]]]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

@end
