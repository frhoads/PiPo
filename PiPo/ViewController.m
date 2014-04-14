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
    NSMutableArray* shifts;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self loadSavedShifts];
    NSLog(@"Items in shifts array: %lu", (unsigned long)shifts.count);

//    if (shifts)
//    {
    
//    }
//    else
//    {
//        shifts = [[NSMutableArray alloc]init];
//        NSLog(@"nothing in shifts array, count is %lu", (unsigned long)shifts.count);
//    }
    
//    NSUserDefaults* loadShiftsDefaults = [NSUserDefaults standardUserDefaults];
//    NSMutableArray* loadShiftsArray = [loadShiftsDefaults objectForKey:@"SavedShifts"];

//    [[[NSUserDefaults standardUserDefaults] arrayForKey:@"YourKey"] mutableCopy];
    
}

- (IBAction)onNewShiftButtonPressed:(id)sender
{
    Punch* newPunch = [[Punch alloc]init];
    newPunch.date = [TimeAndDate getCurrentDate];
    newPunch.time = [TimeAndDate getCurrentTime];
    
    Punches* newShift = [[Punches alloc]init];
    newShift.punches = [[NSMutableArray alloc]init];
    [newShift.punches addObject:newPunch];
    
    [shifts addObject:newShift.punches];
    
    [shiftTableView reloadData];
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:shifts] forKey:@"SavedShifts"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSLog(@"Items in shifts array: %lu", (unsigned long)shifts.count);
}

- (void)saveShift:(NSMutableArray*)newShift key:(NSString*)key
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:@"savedShifts"];
    NSUserDefaults *savedShift = [NSUserDefaults standardUserDefaults];
    [savedShift setObject:encodedObject forKey:@"savedShifts"];
    [savedShift synchronize];
}

-(NSMutableArray*)loadSavedShifts
{
    NSUserDefaults *currentDefaults = [NSUserDefaults standardUserDefaults];
    NSData *savedShifts = [currentDefaults objectForKey:@"SavedShifts"];
    if (savedShifts != nil)
    {
        NSArray *oldArray = [NSKeyedUnarchiver unarchiveObjectWithData:savedShifts];
        if (oldArray != nil)
        {
            shifts = [[NSMutableArray alloc] initWithArray:oldArray];
        }
    }
    else if (savedShifts == nil)
    {
        
        shifts = [[NSMutableArray alloc] init];
    }

    if (shifts.count != 0)
    {
        shifts = [NSKeyedUnarchiver unarchiveObjectWithData:savedShifts];
    }
    return shifts;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController* shiftsViewController = segue.destinationViewController;
    NSIndexPath* indexPath = [shiftTableView indexPathForSelectedRow];
    shiftsViewController.punches = shifts[indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    Punch* shift = [shifts objectAtIndex:indexPath.row];
//    cell.textLabel.text = shift.date;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"Time in: %@", shift.time];
    
    Punches* shift = [Punches new];
    shift.punches = [shifts objectAtIndex:indexPath.row];
    Punch* punch = [shift.punches objectAtIndex:0];
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Shift Cell"];
    
    cell.textLabel.text = punch.date;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Time in: %@", punch.time];
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
