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

@interface EndViewController : UIViewController

@property (strong, nonatomic) EndView *view;
@property (nonatomic, strong) Team *team;
@property (nonatomic, strong) NSMutableArray *scores;
- (id)initWithTeam:(Team *)team andScores:(NSMutableArray *)scores;

@end
