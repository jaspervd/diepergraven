//
//  ScreensView.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftBarView.h"
#import "MapBoxView.h"

@interface ScreensView : UIView
@property (nonatomic, strong) LeftBarView *leftBarV;
@property (nonatomic, strong) MapBoxView *mapBoxV;

@end
