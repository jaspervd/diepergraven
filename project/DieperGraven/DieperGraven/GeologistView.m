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
        
        self.backgroundColor = [UIColor blackColor];
        RMMapboxSource *source = [[RMMapboxSource alloc] initWithMapID:@"jaspervd.hk9425ca"];
        CGRect screenFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        if(!source) {
            RMMBTilesSource *offlineSource = [[RMMBTilesSource alloc] initWithTileSetURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"DieperGraven" ofType:@"mbtiles"]]];
            self.mapView = [[RMMapView alloc] initWithFrame:screenFrame andTilesource:offlineSource centerCoordinate:CLLocationCoordinate2DMake(50.881, 2.885) zoomLevel:10 maxZoomLevel:17 minZoomLevel:10 backgroundImage:nil];
        } else {
            self.mapView = [[RMMapView alloc] initWithFrame:screenFrame andTilesource:source centerCoordinate:CLLocationCoordinate2DMake(50.881, 2.885) zoomLevel:10 maxZoomLevel:17 minZoomLevel:10 backgroundImage:nil];
        }
        [self addSubview:self.mapView];
 
        self.mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.mapView.adjustTilesForRetinaDisplay = YES;
        self.mapView.zoom = 16;
        self.mapView.minZoom = 15;
        self.mapView.maxZoom = 17;
        //[self.mapView removeAllCachedImages];
        self.mapView.delegate = self;
        NSString *path = [[NSBundle mainBundle] pathForResource:@"route" ofType:@"geojson"];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[[NSData alloc] initWithContentsOfFile:path] options:0 error:&error];
        
        for (NSUInteger i = 0; i < [[json objectForKey:@"features"] count]; i++)
        {
            self.points = [[[[[json objectForKey:@"features"] objectAtIndex:i] valueForKey:@"geometry"] valueForKey:@"coordinates"]mutableCopy];
            
            for (NSUInteger i = 0; i < [self.points count]; i++)
            {
                [self.points replaceObjectAtIndex:i withObject:[[CLLocation alloc] initWithLatitude:[[[self.points objectAtIndex:i] objectAtIndex:1] doubleValue]
                                                                                          longitude:[[[self.points objectAtIndex:i] objectAtIndex:0] doubleValue]]];
            }
            
            RMAnnotation *annotation = [[RMAnnotation alloc] initWithMapView:self.mapView
                                                                  coordinate:self.mapView.centerCoordinate
                                                                    andTitle:@"Route"];
            
            [self.mapView addAnnotation:annotation];
            
            [annotation setBoundingBoxFromLocations:self.points];
        }
        
        self.mapView.showsUserLocation = YES;
        self.mapView.userTrackingMode = RMUserTrackingModeFollow;
        
        [self staticAnnotations];
        
    }
    return self;
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
    if (annotation.isUserLocationAnnotation)
        return nil;
    
    RMShape *shape = [[RMShape alloc] initWithView:mapView];
    
    shape.lineColor = [UIColor whiteColor];
    shape.lineWidth = 3.0;
    
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


@end
