//
//  DetailViewController.h
//  PiPo
//
//  Created by Fletcher Rhoads on 3/18/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Punches.h"
#import "Punch.h"

@interface DetailViewController : UIViewController

@property Punch* punch;
@property (nonatomic, strong) Punches* shiftPunches;
@property NSMutableArray* shifts;

@end
