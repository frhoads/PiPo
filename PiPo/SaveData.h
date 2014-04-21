//
//  SaveData.h
//  PiPo
//
//  Created by Fletcher Rhoads on 4/20/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface SaveData : NSObject
@property NSMutableArray* shifts;

+ (void)saveData;

@end
