//
//  EndViewController.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "EndView.h"
#import "Team.h"
#import "StartViewController.h"

@interface EndViewController : UIViewController

@property (strong, nonatomic) EndView *view;
@property (nonatomic, strong) Team *team;
@property (nonatomic, strong) NSDate *time;
@property int score;

- (id)initWithTeam:(Team *)team time:(NSDate *)time andScore:(int)score;

@end
