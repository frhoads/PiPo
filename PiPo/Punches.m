//
//  Punches.m
//  PiPo
//
//  Created by Fletcher Rhoads on 4/14/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import "Punches.h"

@implementation Punches

@synthesize punches;

- (void) encodeWithCoder:(NSCoder*)encoder
{
    [encoder encodeObject:self.punches forKey:@"punches"];
}

- (id) initWithCoder:(NSCoder*)decoder
{
    self = [[Punches alloc] init];
    if (self = [super init]) {
        self.punches = [decoder decodeObjectForKey:@"punches"];
    }
    return self;
}


@end
