//
//  TableDemoTableViewController.h
//  sample
//
//  Created by 桜井 克朗 on 2014/08/08.
//  Copyright (c) 2014年 桜井 克朗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableDemoTableViewController : UITableViewController

//@property (strong, nonatomic) NSMutableArray *fileList;
//@property (strong, nonatomic) NSString *currentPath;
@property (strong, nonatomic) NSFileManager *fm;
@property BOOL isPoped;
@property (strong, nonatomic) NSString *previousPath;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

- (void)startEditing;
- (void)stopEditing;
- (void)reload;

@end
