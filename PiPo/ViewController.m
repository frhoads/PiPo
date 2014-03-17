//
//  ViewController.m
//  PiPo
//
//  Created by Fletcher Rhoads on 3/17/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import "ViewController.h"

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
    [shifts addObject:[self getCurrentDate]];
    [shiftTableView reloadData];
    NSLog(@"%@",shifts);
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
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [shifts objectAtIndex:indexPath.row];
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
