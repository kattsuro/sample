//
//  ShootStuffUpTableViewController.h
//  sample
//
//  Created by 桜井 克朗 on 2014/08/14.
//  Copyright (c) 2014年 桜井 克朗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShootStuffUpTableViewController : UITableViewController{
    UISlider *musicVolumeControl;
    UISlider *gameVolumeControl;
    UISegmentedControl *difficultyControl;
    
    UISlider *shipStabilityControl;
    UISwitch *badGuyControl;
    UISwitch *debugControl;
    
    UITextField *versionControl;
}

-(id)init;
-(void)dealloc;
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
