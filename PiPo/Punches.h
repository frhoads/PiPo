//
//  Punches.h
//  PiPo
//
//  Created by Fletcher Rhoads on 4/14/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Punches : NSObject

@property (strong, nonatomic) NSMutableArray* punches;

- (void) encodeWithCoder:(NSCoder*)encoder;

- (id) initWithCoder:(NSCoder*)decoder;

@end
