//
//  DetailViewController.m
//  PiPo
//
//  Created by Fletcher Rhoads on 3/18/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"
#import "Punch.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
{
    NSMutableArray* times;
    __weak IBOutlet UITableView *timeTableView;
}
@synthesize punch;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    times = [[NSMutableArray alloc]initWithObjects:punch, nil];
    [timeTableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Punch* NewPunch = [times objectAtIndex:indexPath.row];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Detail Cell"];
    
    cell.textLabel.text = NewPunch.date;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Time in: %@", NewPunch.time];
    cell.textLabel.textColor = [UIColor blackColor];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return times.count;
}


@end
