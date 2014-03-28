//
//  ViewController.m
//  PiPo
//
//  Created by Fletcher Rhoads on 3/17/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "TimeAndDate.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController
{
    __weak IBOutlet UITableView *shiftTableView;
    NSMutableArray* shifts;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!shifts)
    {
        shifts = [[NSMutableArray alloc]init];
    }
}

- (IBAction)onNewShiftButtonPressed:(id)sender
{
    Punch* newShift = [[Punch alloc]init];
    newShift.date = [TimeAndDate getCurrentDate];
    newShift.time = [TimeAndDate getCurrentTime];
    [shifts addObject:newShift];
    [shiftTableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController* shiftsViewController = segue.destinationViewController;
    NSIndexPath* indexPath = [shiftTableView indexPathForSelectedRow];
    shiftsViewController.punch = shifts[indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Punch* newShift = [shifts objectAtIndex:indexPath.row];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Shift Cell"];
    
    cell.textLabel.text = newShift.date;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Time in: %@", newShift.time];
    cell.textLabel.textColor = [UIColor blackColor];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return shifts.count;
}

//- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
//    
//}

@end
