//
//  WebViewViewController.m
//  sample
//
//  Created by 桜井 克朗 on 2014/08/14.
//  Copyright (c) 2014年 桜井 克朗. All rights reserved.
//

#import "WebViewViewController.h"

@implementation WebViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *query = [[searchBar.text stringByReplacingOccurrencesOfString:@" " withString:@"+"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.google.com/search?q=%@", query]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

@end
