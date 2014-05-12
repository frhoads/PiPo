//
//  Punch.m
//  PiPo
//
//  Created by Fletcher Rhoads on 3/18/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import "Punch.h"

@implementation Punch

@synthesize dateTime;
@synthesize photo;

- (void) encodeWithCoder:(NSCoder*)encoder
{
    [encoder encodeObject:self.dateTime forKey:@"dateTime"];
}

- (id) initWithCoder:(NSCoder*)decoder
{
    self = [[Punch alloc] init];
    if (self = [super init]) {
        self.dateTime = [decoder decodeObjectForKey:@"dateTime"];
    }
    return self;
}

@end
