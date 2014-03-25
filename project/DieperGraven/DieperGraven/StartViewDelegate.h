//
//  StartViewDelegate.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 25/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

@class StartViewController;

#import "Team.h"

@protocol StartViewDelegate <NSObject>

@required
- (void)startViewController:(StartViewController *)startVC didSaveTeam:(Team *)team;

@end