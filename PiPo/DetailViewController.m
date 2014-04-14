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

@interface DetailViewController ()

@end

@implementation DetailViewController
{
    __weak IBOutlet UITableView *timeTableView;
    NSMutableArray* times;
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
    
    [self loadSavedPunches];
    
    //times = [[NSMutableArray alloc] initWithObjects:punch, nil];
    
    [timeTableView reloadData];
}

- (NSMutableArray*)loadSavedPunches
{
    NSUserDefaults *timesDefaults = [NSUserDefaults standardUserDefaults];
    NSData *savedTimes = [timesDefaults objectForKey:@"SavedTimes"];
    if (savedTimes != nil)
    {
        NSArray *oldTimesArray = [NSKeyedUnarchiver unarchiveObjectWithData:savedTimes];
        if (oldTimesArray != nil)
        {
            times = [[NSMutableArray alloc] initWithArray:oldTimesArray];
        }
    }
    times = [NSKeyedUnarchiver unarchiveObjectWithData:savedTimes];
    return times;
}

- (IBAction)onPunchButtonPressed:(id)sender
{
    Punch* newPunch = [[Punch alloc]init];
    newPunch.date = [TimeAndDate getCurrentDate];
    newPunch.time = [TimeAndDate getCurrentTime];
    [times addObject:newPunch];
    [timeTableView reloadData];
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:times] forKey:@"SavedTimes"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Punch* NewPunch = [times objectAtIndex:indexPath.row];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Detail Cell"];
    
    cell.textLabel.text = NewPunch.date;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Punch at: %@", NewPunch.time];
    cell.textLabel.textColor = [UIColor blackColor];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return times.count;
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
