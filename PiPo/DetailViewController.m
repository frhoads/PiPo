//
//  DetailViewController.m
//  PiPo
//
//  Created by Fletcher Rhoads on 3/18/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import "DetailViewController.h"
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
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Punch* newPunch = [self.shiftPunches.punches objectAtIndex:indexPath.row];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Detail Cell"];
    cell.textLabel.text = newPunch.date;
    cell.detailTextLabel.text = newPunch.time;
    
    return cell;
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
