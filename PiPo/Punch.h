//
//  Punch.h
//  PiPo
//
//  Created by Fletcher Rhoads on 3/18/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Punch : NSObject <NSCoding>

@property NSDate* time;
@property NSDate* date;
@property UIImage* photo;

//- (void) encodeWithCoder:(NSCoder*)encoder;
//
//- (id) initWithCoder:(NSCoder*)decoder;

@end
