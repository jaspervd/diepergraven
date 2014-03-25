//
//  StartViewController.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 25/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartView.h"
#import "TeamFactory.h"
#import "MapBoxViewController.h"
#import "StartViewDelegate.h"

@interface StartViewController : UIViewController <StartViewDelegate>
@property (strong, nonatomic) StartView *view;

@end
