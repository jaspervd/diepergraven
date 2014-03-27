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
#import <RMMarker.h>
#import <RMPointAnnotation.h>
#import <RMUserLocation.h>
#import <CoreLocation/CoreLocation.h>
#import <RMShape.h>

@interface GeologistView : UIView <CLLocationManagerDelegate>

@property (nonatomic, strong) RMMapView *mapView;
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSMutableArray *points;

@end
