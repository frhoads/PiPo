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
#import "Punch.h"
#import "Punches.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController
{
    __weak IBOutlet UITableView *shiftTableView;
}

@synthesize punches;
@synthesize shifts;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadSavedShifts];
    NSLog(@"Items in shifts array: %lu", (unsigned long)shifts.count);
}

- (IBAction)onNewShiftButtonPressed:(id)sender
{
    Punch* newPunch = [[Punch alloc]init];
    newPunch.dateTime = [TimeAndDate getDateTime];
    //newPunch.time = [TimeAndDate getCurrentTime];
    
    Punches* newShift = [[Punches alloc]init];
    newShift.punches = [[NSMutableArray alloc]init];
    [newShift.punches addObject:newPunch];
    
    [shifts addObject:newShift.punches];
    
    [shiftTableView reloadData];
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:shifts] forKey:@"SavedShifts"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSLog(@"Items in shifts array: %lu", (unsigned long)shifts.count);
}

-(NSMutableArray*)loadSavedShifts
{
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *savedShifts = [NSData new];
    savedShifts = [currentDefaults objectForKey:@"SavedShifts"];
    if (savedShifts != nil)
    {
        NSArray *oldArray = [NSKeyedUnarchiver unarchiveObjectWithData:savedShifts];
        if (oldArray != nil)
        {
            shifts = [[NSMutableArray alloc] initWithArray:oldArray];
        }
        else
        {
            shifts = [[NSMutableArray alloc] init];
        }
    }

    if (shifts.count != 0)
    {
        shifts = [NSKeyedUnarchiver unarchiveObjectWithData:savedShifts];
    }
    return shifts;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController* dvc = [segue destinationViewController];
    NSIndexPath* indexPath = [shiftTableView indexPathForSelectedRow];
    dvc.shiftPunches = [Punches new];
    dvc.shiftPunches.punches = shifts[indexPath.row];
    dvc.shifts = [NSMutableArray new];
    dvc.shifts = shifts;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Punches* shift = [Punches new];
    shift.punches = [shifts objectAtIndex:indexPath.row];
    Punch* punch = [shift.punches objectAtIndex:0];
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Shift Cell"];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    NSString* dateString = [dateFormatter stringFromDate:punch.dateTime];
    cell.textLabel.text = dateString;
    
    NSDateFormatter* timeFormatter = [[NSDateFormatter alloc]init];
    [timeFormatter setDateFormat:@"hh:mm a"];
    NSString* timeString = [timeFormatter stringFromDate:punch.dateTime];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Time in: %@", timeString];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return shifts.count;
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
