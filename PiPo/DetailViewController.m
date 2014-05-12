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
    __weak IBOutlet UILabel *timeOffLabel;
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
    newPunch.dateTime = [TimeAndDate getDateTime];
    [self.shiftPunches.punches addObject:newPunch];
    [timeTableView reloadData];
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:shifts] forKey:@"SavedShifts"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self caluclateTime];
    
    NSLog(@"Items in shifts array: %lu", (unsigned long)shifts.count);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Punch* newPunch = [self.shiftPunches.punches objectAtIndex:indexPath.row];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Detail Cell"];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    NSString* dateString = [dateFormatter stringFromDate:newPunch.dateTime];
    cell.textLabel.text = dateString;
    
    NSDateFormatter* timeFormatter = [[NSDateFormatter alloc]init];
    [timeFormatter setDateFormat:@"hh:mm a"];
    NSString* timeString = [timeFormatter stringFromDate:newPunch.dateTime];
    cell.detailTextLabel.text = timeString;
    
    return cell;
}

- (void)caluclateTime
{
    if (shiftPunches.punches.count > 1)
    {
        double timeOnInSeconds;
        for (int x = 1; x < shiftPunches.punches.count; x+=2)
        {
            double shiftDiffrenceInSeconds;
            shiftDiffrenceInSeconds = [[[shiftPunches.punches objectAtIndex:x] dateTime] timeIntervalSinceDate:[[shiftPunches.punches objectAtIndex:(x - 1)] dateTime]];
            
            timeOnInSeconds += shiftDiffrenceInSeconds;
        }
        double timeOnInHours = timeOnInSeconds/60/60;
        timeOnLabel.text = [NSString stringWithFormat:@"%f", timeOnInHours];
    }
    
    if (shiftPunches.punches.count > 2)
    {
        double timeOffInSeconds;
        for (int x = 2; x < shiftPunches.punches.count; x+=2)
        {
            double shiftDiffrenceInSeconds;
            shiftDiffrenceInSeconds = [[[shiftPunches.punches objectAtIndex:x] dateTime] timeIntervalSinceDate:[[shiftPunches.punches objectAtIndex:(x - 1)] dateTime]];
            
            timeOffInSeconds += shiftDiffrenceInSeconds;
        }
        double timeOffInHours = timeOffInSeconds/60/60;
        timeOffLabel.text = [NSString stringWithFormat:@"%f", timeOffInHours];
    }
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
