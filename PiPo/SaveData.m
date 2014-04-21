//
//  SaveData.m
//  PiPo
//
//  Created by Fletcher Rhoads on 4/20/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import "SaveData.h"

@implementation SaveData
@synthesize shifts;

+ (void)saveData
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:shifts] forKey:@"SavedShifts"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
