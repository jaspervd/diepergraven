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
#import "ObjectViewProtocol.h"
#import <CoreLocation/CoreLocation.h>

@interface ScreensViewController : UIViewController <CLLocationManagerDelegate, ObjectViewProtocol>

@property (strong, nonatomic) ScreensView *view;
@property (nonatomic, strong) Team *team;
- (id)initWithTeam:(Team *)team;

@property (nonatomic,strong) NSMutableArray *objectsArray;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSMutableArray *geofences;
@property (strong, nonatomic) NSMutableArray *arrPossibleObjects;

@end
