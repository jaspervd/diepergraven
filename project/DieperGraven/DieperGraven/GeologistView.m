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
        [self addSubview:self.mapView];
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
