//
//  ScreensViewController.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Team.h"
#import "ScreensView.h"
#import "EndViewController.h"

@interface ScreensViewController : UIViewController

@property (strong, nonatomic) ScreensView *view;
@property (nonatomic, strong) Team *team;
- (id)initWithTeam:(Team *)team;

@property (nonatomic,strong) NSMutableArray *objectsArray;

@end
