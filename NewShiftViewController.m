//
//  NewShiftViewController.m
//  PiPo
//
//  Created by Fletcher Rhoads on 3/17/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import "NewShiftViewController.h"

@interface NewShiftViewController ()

@end

@implementation NewShiftViewController
{
    __weak IBOutlet UILabel *displayPunchTimeLabel;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)punch:(id)sender
{
    NSDate* currentTime = [NSDate date];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString* resultString = [dateFormatter stringFromDate:currentTime];
    displayPunchTimeLabel.text = resultString;
}

- (IBAction)onCancelButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
