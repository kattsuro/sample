//
//  MainMenuViewController.m
//  sample
//
//  Created by 桜井 克朗 on 2014/08/07.
//  Copyright (c) 2014年 桜井 克朗. All rights reserved.
//

#import "MainMenuViewController.h"
#import "SourceViewViewController.h"
#import "NavBarDemoViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapButtonSourveView:(id)sender {
    SourceViewViewController *svvc = [[SourceViewViewController alloc] init];
    [self.navigationController pushViewController:svvc animated:TRUE];
}

- (IBAction)tapNavBarDemo:(id)sender {
    NavBarDemoViewController *nbvc = [[NavBarDemoViewController alloc] init];
    [self.navigationController pushViewController:nbvc animated:TRUE];
}
@end
