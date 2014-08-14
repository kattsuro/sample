//
//  ShootStuffUpTableViewController.m
//  sample
//
//  Created by 桜井 克朗 on 2014/08/14.
//  Copyright (c) 2014年 桜井 克朗. All rights reserved.
//

#import "ShootStuffUpTableViewController.h"

@implementation ShootStuffUpTableViewController

-(id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self != nil) {
        self.title = @"ゲーム設定";
    }
    return self;
}

-(void)loadView
{
    [super loadView];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 1;
            break;
        default:
            break;
    }
    return 0;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"ゲーム設定";
            break;
        case 1:
            return @"高度な設定";
            break;
        case 2:
            return @"プログラムについて";
            break;
    }
    return nil;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [NSString stringWithFormat:@"%lu:%lu", (unsigned long)[indexPath indexAtPosition:0], (unsigned long)[indexPath indexAtPosition:1]];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell != nil) {
        return cell;
    }
    cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    switch ([indexPath indexAtPosition:0]) {
        case 0:
            switch ([indexPath indexAtPosition:1]) {
                case 0:
                    musicVolumeControl = [self generateSlider];
                    [cell addSubview:musicVolumeControl];
                    cell.textLabel.text = @"音楽の音量";
                    break;
                case 1:
                    gameVolumeControl = [self generateSlider];
                    [cell addSubview:gameVolumeControl];
                    cell.textLabel.text = @"ゲームの音量";
                    break;
                case 2:
                    difficultyControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(170.0, 5.0, 125.0, 35.0)];
                    [difficultyControl insertSegmentWithTitle:@"易" atIndex:0 animated:NO];
                    [difficultyControl insertSegmentWithTitle:@"難" atIndex:1 animated:NO];
                    difficultyControl.selectedSegmentIndex=0;
                    [cell addSubview:difficultyControl];
                    cell.textLabel.text = @"難易度";
                    break;
            }
            break;
        case 1:
            switch ([indexPath indexAtPosition:1]) {
                case 0:
                    shipStabilityControl = [self generateSlider];
                    [cell addSubview:shipStabilityControl];
                    cell.textLabel.text = @"自機の安定性";
                    break;
                case 1:
                    badGuyControl = [[UISwitch alloc] initWithFrame:CGRectMake(170.0, 10.0, 0.0, 0.0)];
                    badGuyControl.on = YES;
                    [cell addSubview:badGuyControl];
                    cell.textLabel.text = @"敵機";
                    break;
                case 2:
                    debugControl = [[UISwitch alloc] initWithFrame:CGRectMake(170.0, 10.0, 0.0, 0.0)];
                    debugControl.on = NO;
                    [cell addSubview:debugControl];
                    cell.textLabel.text = @"デバッグ";
                    break;
            }
            break;
        case 2:
            versionControl = [[UITextField alloc] initWithFrame:CGRectMake(170.0, 10.0, 125.0, 38.0)];
            versionControl.text = @"1.0.0-J Rev.B";
            [cell addSubview:versionControl];
            [versionControl setEnabled:NO];
            cell.textLabel.text = @"バージョン";
            break;
            
        default:
            break;
    }
    
    return cell;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

-(UISlider *)generateSlider
{
    UISlider *control = [[UISlider alloc] initWithFrame:CGRectMake(170.0, 0.0, 125.0, 50.0)];
    control.minimumValue = 0.0;
    control.maximumValue = 10.0;
    control.value = 3.5;
    return control;
}
@end
