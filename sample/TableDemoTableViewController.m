//
//  TableDemoTableViewController.m
//  sample
//
//  Created by 桜井 克朗 on 2014/08/08.
//  Copyright (c) 2014年 桜井 克朗. All rights reserved.
//

#import "TableDemoTableViewController.h"

@interface TableDemoTableViewController (){
    NSMutableArray *contentsDirectory;
}

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
    NSString *currentPath = [self.fm currentDirectoryPath];
    contentsDirectory = [[self.fm contentsOfDirectoryAtPath: currentPath error: nil] mutableCopy];
    [self.tableView reloadData];
    
    //_fileList = [[NSMutableArray alloc] init];
    // sample with enumeratorAtPath:NSHomeDirectory
    /**
    NSDirectoryEnumerator *dirEnum;
    NSString *file;
    dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:NSHomeDirectory()];
    while ((file = [dirEnum nextObject])) {
        NSDictionary *dir = [dirEnum fileAttributes];
        NSMutableDictionary *mdir = [dir mutableCopy];
        mdir[@"file_name"] = file;
        if ([[dir objectForKey:NSFileType] isEqualToString:NSFileTypeDirectory]) {
            NSLog(@"%@", file);
        }
        //NSDictionary *files = [NSDictionary dictionaryWithObjectsAndKeys:file, dir, nil];
        [_fileList addObject:mdir];
    }
     **/
    /**
    NSArray *dirArr;
    dirArr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[self.fm currentDirectoryPath] error:nil];
    for (NSString *file in dirArr) {
        NSDictionary *attr = [[NSFileManager defaultManager] attributesOfItemAtPath:[self.fm currentDirectoryPath] error:nil];
        NSMutableDictionary *mattr = [attr mutableCopy];
        mattr[@"file_name"] = file;
        [_fileList addObject:mattr];
    }
    [self.tableView reloadData];
     **/
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    /** buttons **/
    UIBarButtonItem *edit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(startEditing)];
    UIBarButtonItem *reload = [[UIBarButtonItem alloc] initWithTitle:@"再読込" style:UIBarButtonItemStylePlain target:self action:@selector(reload)];
    //UIBarButtonItem *back = self.navigationItem.backBarButtonItem;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:edit,reload, nil];
    
    /** filemanager **/
    if (self.fm == nil) {
        _fm = [NSFileManager defaultManager];
    }
    NSString *currentPath = [self.fm currentDirectoryPath];
    contentsDirectory = [[self.fm contentsOfDirectoryAtPath: currentPath error: nil] mutableCopy];
    //[self reload];
    
    NSLog(@"%@", [self.fm currentDirectoryPath]);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    if (self.isPoped)
    {
        [self.fm changeCurrentDirectoryPath: self.previousPath];
        self.isPoped = NO;
    }
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
    return contentsDirectory.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = [indexPath row];
    NSString *content = [contentsDirectory objectAtIndex: [indexPath row]];
    NSDictionary *attr = [self.fm attributesOfItemAtPath:content error:nil];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:content];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:content];
        cell.textLabel.text = [contentsDirectory objectAtIndex: row];
    }
    if (attr[NSFileType] == NSFileTypeDirectory) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
        for (int i=0; i < contentsDirectory.count; i++) {
            if ([cell.textLabel.text isEqualToString:[contentsDirectory objectAtIndex:i]]) {
                [contentsDirectory removeObjectAtIndex:i];
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
    NSString *content = [contentsDirectory objectAtIndex: [indexPath row]];
    NSDictionary *attr = [self.fm attributesOfItemAtPath:content error:nil];
    
    //[self setCurrentPath:attributes[@"file_name"]];
    if (attr[NSFileType] == NSFileTypeDirectory) {
        // navigate
        TableDemoTableViewController *tdtvc = [[TableDemoTableViewController alloc] init];
        tdtvc.title = [self.fm currentDirectoryPath];
        tdtvc.fm = self.fm;

        
        [self.navigationController pushViewController: tdtvc animated: YES];
        self.previousPath = [self.fm currentDirectoryPath];
        self.isPoped = YES;
        [self.fm changeCurrentDirectoryPath:content];
    } else if (attr[NSFileType] == NSFileTypeRegular) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ファイルの選択" message:[NSString stringWithFormat:@"ファイル'%@'が選択されました", content] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
}

- (void)updateNavigation
{
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:nil];
    //segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [_segmentedControl insertSegmentWithTitle:@"ウサギ" atIndex:0 animated:NO];
    //[_segmentedControl addTarget:self action:@selector(controllPressed:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = _segmentedControl;
}

/**
- (NSString)getValidCurrentPath
{
    
}
 **/

@end
