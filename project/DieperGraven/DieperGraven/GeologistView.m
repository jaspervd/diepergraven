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
        self.mapView = [[RMMapView alloc] initWithFrame:frame andTilesource:source centerCoordinate:CLLocationCoordinate2DMake(50.881, 2.885) zoomLevel:5 maxZoomLevel:17 minZoomLevel:5 backgroundImage:nil];
        [self addSubview:self.mapView];
        
        self.mapView.showsUserLocation = YES;
        self.mapView.userTrackingMode = RMUserTrackingModeFollow;
 
        
        /*NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"route" ofType:@"geojson"];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[[NSData alloc] initWithContentsOfFile:jsonPath] options:0 error:nil];
        
        self.points = [[[[json objectForKey:@"features"] objectAtIndex:0] valueForKeyPath:@"geometry.coordinates"] mutableCopy];
        
        for (NSUInteger i = 0; i < [self.points count]; i++) {
            [self.points replaceObjectAtIndex:i withObject:[[CLLocation alloc] initWithLatitude:[[[self.points objectAtIndex:i] objectAtIndex:1] doubleValue] longitude:[[[self.points objectAtIndex:i] objectAtIndex:0] doubleValue]]];
        }
        
        RMAnnotation *annotation = [[RMAnnotation alloc] initWithMapView:self.mapView coordinate:self.mapView.centerCoordinate andTitle:@"Pad"];
        
        [self.mapView addAnnotation:annotation];
        [annotation setBoundingBoxFromLocations:self.points];*/
        
        [self staticAnnotations];
        
    }
    return self;
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
    if (annotation.isUserLocationAnnotation)
        return nil;
    
    RMShape *shape = [[RMShape alloc] initWithView:mapView];
    
    shape.lineColor = [UIColor purpleColor];
    shape.lineWidth = 5.0;
    
    for (CLLocation *point in self.points)
        [shape addLineToCoordinate:point.coordinate];
    
    return shape;
}

- (void)mapView:(RMMapView *)mapView didUpdateUserLocation:(RMUserLocation *)userLocation {
        [mapView setCenterCoordinate:mapView.userLocation.location.coordinate animated:YES];
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
