//
//  Punch.h
//  PiPo
//
//  Created by Fletcher Rhoads on 3/18/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Punch : NSObject <NSCoding>

@property NSString* time;
@property NSString* date;
@property UIImage* photo;

//- (void) encodeWithCoder:(NSCoder*)encoder;
//
//- (id) initWithCoder:(NSCoder*)decoder;

@end
