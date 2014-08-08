//
//  NavBarDemoViewController.m
//  sample
//
//  Created by 桜井 克朗 on 2014/08/07.
//  Copyright (c) 2014年 桜井 克朗. All rights reserved.
//

#import "NavBarDemoViewController.h"
#import "CopyRightViewController.h"

@interface NavBarDemoViewController ()

@end

@implementation NavBarDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *credits = [[UIBarButtonItem alloc] initWithTitle:@"copyright" style:UIBarButtonItemStylePlain target:self action:@selector(didTapCopyRight)];
    self.navigationItem.rightBarButtonItem = credits;
    
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:nil];
    //segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [_segmentedControl insertSegmentWithTitle:@"ウサギ" atIndex:0 animated:NO];
    [_segmentedControl insertSegmentWithTitle:@"仔馬" atIndex:1 animated:NO];
    [_segmentedControl insertSegmentWithTitle:@"ハッカー" atIndex:2 animated:NO];
    [_segmentedControl addTarget:self action:@selector(controllPressed:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = _segmentedControl;
    _segmentedControl.selectedSegmentIndex = 0;
    [self controllPressed:nil];
}

- (void)didTapCopyRight
{
    CopyRightViewController *crvc = [[CopyRightViewController alloc] init];
    [self.navigationController pushViewController:crvc animated:YES];
    NSLog(@"didTapCopyRight");
}

- (void)controllPressed:(id)sender
{
    NSInteger index = _segmentedControl.selectedSegmentIndex;
    NSLog(@"controllPressed:%ld", (long)index);
    if (index == 0) {
        _textView.text = @"うさぎ";
    } else if(index == 1) {
        _textView.text = @"仔牛";
    } else if(index == 2) {
        _textView.text = @"ハッカー";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
