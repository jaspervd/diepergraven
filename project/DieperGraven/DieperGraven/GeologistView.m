//
//  MapBoxView.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 25/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "GeologistView.h"

@implementation GeologistView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        RMMapboxSource *source = [[RMMapboxSource alloc] initWithMapID:@"jaspervd.hk9425ca"];
        self.mapView = [[RMMapView alloc] initWithFrame:frame andTilesource:source centerCoordinate:CLLocationCoordinate2DMake(50.881, 2.885) zoomLevel:14 maxZoomLevel:20 minZoomLevel:14 backgroundImage:nil];
        self.mapView.showsUserLocation = YES;
        self.mapView.userTrackingMode = RMUserTrackingModeFollow;
        
        [self addSubview:self.mapView];
        
        
        [self staticAnnotations];
        
    }
    return self;
}

- (void)staticAnnotations {
   /* NSString *annotationTitle = @"name";
    CLLocationCoordinate2D coordinateX = CLLocationCoordinate2DMake(50.876672, 2.916466);*/
    
    RMPointAnnotation *annotation01 = [[RMPointAnnotation alloc] initWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake(50.876672, 2.916466) andTitle:@"Buffs Road Cemetery"];
    [self.mapView addAnnotation:annotation01];
    
    RMPointAnnotation *annotation02 = [[RMPointAnnotation alloc] initWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake(50.878328, 2.911473) andTitle:@"Track X Cemetery"];
    [self.mapView addAnnotation:annotation02];
    
    RMPointAnnotation *annotation03 = [[RMPointAnnotation alloc] initWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake(50.883934, 2.893393) andTitle:@"No Man’s Cot Cemetery"];
    [self.mapView addAnnotation:annotation03];
    
    RMPointAnnotation *annotation04 = [[RMPointAnnotation alloc] initWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake(50.885559, 2.878218) andTitle:@"Colne Valley Cemetery"];
    [self.mapView addAnnotation:annotation04];
    
    RMPointAnnotation *annotation05 = [[RMPointAnnotation alloc] initWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake(50.873213, 2.897638) andTitle:@"New Irish Farm Cemetery"];
    [self.mapView addAnnotation:annotation05];
    
    RMPointAnnotation *annotation06 = [[RMPointAnnotation alloc] initWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake(50.874477, 2.894056) andTitle:@"Divisional Collecting Post Cemetery & Extension"];
    [self.mapView addAnnotation:annotation06];
    
    RMPointAnnotation *annotation07 = [[RMPointAnnotation alloc] initWithMapView:self.mapView coordinate:CLLocationCoordinate2DMake(50.873502, 2.893526) andTitle:@"La Belle Alliance Cemetery"];
    [self.mapView addAnnotation:annotation07];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
