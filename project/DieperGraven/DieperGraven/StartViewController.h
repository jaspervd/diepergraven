//
//  StartViewController.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 25/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "StartView.h"
#import "TeamFactory.h"
#import "ScreensViewController.h"

@interface StartViewController : UIViewController
@property (strong, nonatomic) StartView *view;

@property (strong, nonatomic) NSMutableArray *scores;

@end
