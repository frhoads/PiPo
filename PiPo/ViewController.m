//
//  ViewController.m
//  PiPo
//
//  Created by Fletcher Rhoads on 3/17/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController
{
    __weak IBOutlet UITableView *shiftTableView;
    NSMutableArray* shifts;
    NSMutableArray* times;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!shifts)
    {
        shifts = [[NSMutableArray alloc]init];
    }
    
    if (!times)
    {
        times = [[NSMutableArray alloc]init];
    }
}

- (IBAction)onNewShiftButtonPressed:(id)sender
{
    Punch* newShift = [[Punch alloc]init];
    newShift.date = [self getCurrentDate];
    newShift.time = [self getCurrentTime];
    [shifts addObject:newShift];
    [shiftTableView reloadData];
    
//    [shifts addObject:[self getCurrentDate]];
//    [times addObject:[self getCurrentTime]];
//    [shiftTableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController* shiftsViewController = segue.destinationViewController;
    NSIndexPath* indexPath = [shiftTableView indexPathForSelectedRow];
    shiftsViewController.punch = shifts[indexPath.row];
}

- (NSString*)getCurrentTime
{
    NSDate* currentTime = [NSDate date];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString* timeString = [dateFormatter stringFromDate:currentTime];
    
    return timeString;
}

- (NSString*)getCurrentDate
{
    NSDate* currentDate = [NSDate date];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    NSString* dateString = [dateFormatter stringFromDate:currentDate];
    
    return dateString;
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

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    
}

@end
