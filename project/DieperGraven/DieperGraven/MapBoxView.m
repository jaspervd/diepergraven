//
//  MapBoxView.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 25/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "MapBoxView.h"

@implementation MapBoxView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        RMMapboxSource *source = [[RMMapboxSource alloc] initWithMapID:@"jaspervd.hk9425ca"];
        self.mapView = [[RMMapView alloc] initWithFrame:frame andTilesource:source centerCoordinate:CLLocationCoordinate2DMake(50.881, 2.885) zoomLevel:14 maxZoomLevel:20 minZoomLevel:14 backgroundImage:nil];
        [self addSubview:self.mapView];
        
        RMPointAnnotation *annotation = [[RMPointAnnotation alloc] initWithMapView:self.mapView coordinate:self.mapView.centerCoordinate andTitle:@"IFF"];
        [self.mapView addAnnotation:annotation];
    }
    return self;
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
