//
//  WebViewViewController.h
//  sample
//
//  Created by 桜井 克朗 on 2014/08/14.
//  Copyright (c) 2014年 桜井 克朗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewViewController : UIViewController<UISearchBarDelegate>{
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
