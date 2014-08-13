//
//  EndOfTheWorldViewController.m
//  sample
//
//  Created by 桜井 克朗 on 2014/08/08.
//  Copyright (c) 2014年 桜井 克朗. All rights reserved.
//

#import "EndOfTheWorldViewController.h"

@interface EndOfTheWorldViewController ()

@end

@implementation EndOfTheWorldViewController

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
    UIBarButtonItem *endWorld = [[UIBarButtonItem alloc] initWithTitle:@"世界の終わり" style:UIBarButtonItemStylePlain target:self action:@selector(doEndWorld)];
    self.navigationItem.rightBarButtonItem = endWorld;
}

- (void)doEndWorld
{
    _alert = [[UIAlertView alloc] initWithTitle:@"世界の終わり" message:@"世界を終わらせようとしています" delegate:self cancelButtonTitle:@"間違った" otherButtonTitles:@"do it", nil];
    [_alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"[ALERT]%d番目のボタン", buttonIndex);
    if (alertView == _alert) {
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"世界の終わり" message:@"キャンセルします" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        if (buttonIndex == 0) {
            [alert2 show];
        } else if (buttonIndex == 1) {
            UIActionSheet *mySheet = [[UIActionSheet alloc] initWithTitle:@"本当に終わりにしますか？" delegate:self cancelButtonTitle:@"キャンセル" destructiveButtonTitle:@"終わりにする" otherButtonTitles:nil, nil];
            mySheet.destructiveButtonIndex = 0;
            [mySheet showInView:self.view];
        } else {
            alert2.message = @"不正なボタン";
            [alert2 show];
        }
    } else {
        NSLog(@"別のアラート%@", alertView);
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"[SHEET]%d番目のボタン", buttonIndex);
    UIAlertView *myAlert;
    switch (buttonIndex) {
        case 0:
            [actionSheet dismissWithClickedButtonIndex:0 animated:YES];
            sleep(3);
            exit(0);
            break;
        case 1:
            myAlert = [[UIAlertView alloc] initWithTitle:@"あぁよかった" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [myAlert show];
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
