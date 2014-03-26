//
//  MapBoxView.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 25/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RMMapView.h>
#import <RMMapboxSource.h>
#import <RMPointAnnotation.h>
#import <RMUserLocation.h>

@interface GeologistView : UIView

@property (nonatomic, strong) RMMapView *mapView;

@end
