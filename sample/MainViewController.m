//
//  MainViewController.m
//  sample
//
//  Created by 桜井 克朗 on 2014/08/07.
//  Copyright (c) 2014年 桜井 克朗. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        /**
        CGRect bounds = [[UIScreen mainScreen] applicationFrame];
        UITextView *textView1 = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, bounds.size.width, bounds.size.height / 2)];
        UITextView *textView2 = [[UITextView alloc] initWithFrame:CGRectMake(0, bounds.size.height / 2, bounds.size.width, bounds.size.height / 2)];
        textView1.text = @"テキスト１";
        textView2.text = @"テキスト２";
        [self.view addSubview:textView1];
        [self.view addSubview:textView2];
         **/
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //_window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //_sourceViewViewController = [[SourceViewViewController alloc] init];
    //[_window addSubview:_sourceViewViewController.view];
    //[_window bringSubviewToFront:_sourceViewViewController.view];
    //[_window makeKeyAndVisible];
    // Do any additional setup after loading the view from its nib.
    /**
    CGRect bounds = [[UIScreen mainScreen] applicationFrame];
    UITextView *textView1 = [[UITextView alloc] initWithFrame:CGRectMake(0, 20, 200, 30)];
    UITextView *textView2 = [[UITextView alloc] initWithFrame:CGRectMake(0, bounds.size.height / 2, 100, 100)];
    textView1.text = @"テキスト１";
    textView1.backgroundColor = [UIColor redColor];
    textView1.textAlignment = NSTextAlignmentCenter;
    textView2.text = @"テキスト２";
    textView2.backgroundColor = [UIColor blueColor];
    textView2.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:textView1];
    [self.view addSubview:textView2];
     **/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
