//
//  TableDemoTableViewController.m
//  sample
//
//  Created by 桜井 克朗 on 2014/08/08.
//  Copyright (c) 2014年 桜井 克朗. All rights reserved.
//

#import "TableDemoTableViewController.h"

@interface TableDemoTableViewController ()

@end

@implementation TableDemoTableViewController

- (void)startEditing
{
    [self.tableView setEditing:YES animated:YES];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(stopEditing)];
}

- (void)stopEditing
{
    [self.tableView setEditing:NO animated:YES];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(startEditing)];
}

-(void)reload
{
    NSDirectoryEnumerator *dirEnum;
    NSString *file;
    
    _fileList = [[NSMutableArray alloc] init];
    dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:NSHomeDirectory()];
    while ((file = [dirEnum nextObject])) {
        [_fileList addObject:file];
    }
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self reload];
    UIBarButtonItem *edit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(startEditing)];
    UIBarButtonItem *reload = [[UIBarButtonItem alloc] initWithTitle:@"再読込" style:UIBarButtonItemStylePlain target:self action:@selector(reload)];
    //UIBarButtonItem *back = self.navigationItem.backBarButtonItem;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:edit,reload, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _fileList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [_fileList objectAtIndex:[indexPath indexAtPosition:1]];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textLabel.text = cellIdentifier;
        UIFont *font = [UIFont fontWithName:@"Courier" size:12.0];
        cell.textLabel.font = font;
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // データソースからセルを消去
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        for (int i=0; i < _fileList.count; i++) {
            if ([cell.textLabel.text isEqualToString:[_fileList objectAtIndex:i]]) {
                [_fileList removeObjectAtIndex:i];
            }
        }
        // テーブルからセルを消去
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [array addObject:indexPath];
        [self.tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationTop];
    }
}

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

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ファイルの選択" message:[NSString stringWithFormat:@"ファイル'%@'が選択されました", cell.textLabel.text] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

@end
