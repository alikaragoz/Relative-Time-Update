//
//  MCTableViewController.m
//  Relative Time Update
//
//  Created by Ali Karagoz on 07/02/13.
//  Copyright (c) 2013 Mad Castle. All rights reserved.
//

#import "MCTableViewController.h"
#import "MCTableViewCell.h"

@interface MCTableViewController ()

@end

@implementation MCTableViewController
{
    NSMutableArray *dates;
    NSTimer *timer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dates = [NSMutableArray array];
    
    [_addButton setTarget:self];
    [_addButton setAction:@selector(addButtonTouched:)];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateCells:) userInfo:nil repeats:1.0];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [timer invalidate], timer = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dates count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDate *date = [dates objectAtIndex:indexPath.row];
    [(MCTableViewCell *)cell setDate:date];
    
    return cell;
}

#pragma mark - 

- (void)addButtonTouched:(id)sender
{
    [dates insertObject:[NSDate dateWithTimeIntervalSinceNow:0] atIndex:0];
    [self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)updateCells:(id)sender
{
    NSArray *visibleCells = [self.tableView visibleCells];
    
    for (MCTableViewCell *cell in visibleCells)
    {
        [cell update];
    }
}

@end
