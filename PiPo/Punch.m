//
//  Punch.m
//  PiPo
//
//  Created by Fletcher Rhoads on 3/18/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import "Punch.h"

@implementation Punch

@synthesize date;
@synthesize time;
@synthesize photo;

- (void) encodeWithCoder:(NSCoder*)encoder
{
    [encoder encodeObject:self.date forKey:@"date"];
    [encoder encodeObject:self.time forKey:@"time"];
}

- (id) initWithCoder:(NSCoder*)decoder
{
    self = [[Punch alloc] init];
    if (self = [super init]) {
        self.date = [decoder decodeObjectForKey:@"date"];
        self.time = [decoder decodeObjectForKey:@"time"];
    }
    return self;
}

@end
