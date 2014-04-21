//
//  ViewController.h
//  PiPo
//
//  Created by Fletcher Rhoads on 3/17/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Punches.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) Punches* punches;
@property (strong, nonatomic) NSMutableArray* shifts;


@end
