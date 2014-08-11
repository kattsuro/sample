//
//  TableDemoTableViewController.h
//  sample
//
//  Created by 桜井 克朗 on 2014/08/08.
//  Copyright (c) 2014年 桜井 克朗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableDemoTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *fileList;

- (void)startEditing;
- (void)stopEditing;
- (void)reload;

@end
