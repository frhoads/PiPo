//
//  DetailViewController.m
//  PiPo
//
//  Created by Fletcher Rhoads on 3/18/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"
#import "TimeAndDate.h"
#import "Punches.h"
#import "Punch.h"

@interface DetailViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation DetailViewController
{
    __weak IBOutlet UITableView *timeTableView;
    __weak IBOutlet UILabel *timeOnLabel;
}

@synthesize punch;
@synthesize shiftPunches;
@synthesize shifts;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    [timeTableView reloadData];
    
    [self caluclateTime];
}

- (IBAction)onPunchButtonPressed:(id)sender
{
    Punch* newPunch = [[Punch alloc]init];
    newPunch.date = [TimeAndDate getCurrentDate];
    newPunch.time = [TimeAndDate getCurrentTime];
    [self.shiftPunches.punches addObject:newPunch];
    [timeTableView reloadData];
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:shifts] forKey:@"SavedShifts"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSLog(@"Items in shifts array: %lu", (unsigned long)shifts.count);

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Punch* newPunch = [self.shiftPunches.punches objectAtIndex:indexPath.row];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Detail Cell"];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    NSString* dateString = [dateFormatter stringFromDate:newPunch.date];
    cell.textLabel.text = dateString;
    
    NSDateFormatter* timeFormatter = [[NSDateFormatter alloc]init];
    [timeFormatter setDateFormat:@"hh:mm a"];
    NSString* timeString = [timeFormatter stringFromDate:newPunch.time];
    cell.detailTextLabel.text = timeString;
    
    return cell;
}

- (void)caluclateTime
{
//    Punch* dateOne = [shiftPunches.punches objectAtIndex:0];
//    Punch* dateTwo = [shiftPunches.punches objectAtIndex:1];
//    
//    double timeDifference = [dateOne.time timeIntervalSinceDate:dateTwo.time];
//    
//    NSLog(@"The time difference is %f seconds", timeDifference);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.shiftPunches.punches.count;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // deletion code here
}

@end
