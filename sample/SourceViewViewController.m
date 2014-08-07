//
//  SourceViewViewController.m
//  sample
//
//  Created by 桜井 克朗 on 2014/08/07.
//  Copyright (c) 2014年 桜井 克朗. All rights reserved.
//

#import "SourceViewViewController.h"

@interface SourceViewViewController ()

@end

@implementation SourceViewViewController

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
    NSURL *url = [NSURL URLWithString:@"http://oreilly.com"];
    NSError *error;
    NSString *pageData = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    _textView.text = pageData;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tapButtonBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
