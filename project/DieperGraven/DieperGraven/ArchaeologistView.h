//
//  ArchaeologistView.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ArchaeologistView : UIView <CLLocationManagerDelegate> {
    BOOL _didStartMonitoringRegion;
}

@property (strong, nonatomic) UILabel *lblInfo;
@property (nonatomic,strong) UIButton *btnObject;
@property (nonatomic,strong) UIImageView *digField;
@property CGPoint userPoint;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSMutableArray *geofences;

@end
