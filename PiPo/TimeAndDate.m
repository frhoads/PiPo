//
//  TimeAndDate.m
//  PiPo
//
//  Created by Fletcher Rhoads on 3/28/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import "TimeAndDate.h"

@implementation TimeAndDate


//+ (NSString*)getCurrentTime
//{
//    NSDate* currentTime = [NSDate date];
//    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
//    [dateFormatter setDateFormat:@"hh:mm a"];
//    NSString* timeString = [dateFormatter stringFromDate:currentTime];
//    
//    return timeString;
//}
//
//+ (NSString*)getCurrentDate
//{
//    NSDate* currentDate = [NSDate date];
//    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
//    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
//    NSString* dateString = [dateFormatter stringFromDate:currentDate];
//    
//    return dateString;
//}

+ (NSDate*)getCurrentTime
{
    NSDate* currentTime = [NSDate date];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    
    return currentTime;
}

+ (NSDate*)getCurrentDate
{
    NSDate* currentDate = [NSDate date];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    
    return currentDate;
}

@end
