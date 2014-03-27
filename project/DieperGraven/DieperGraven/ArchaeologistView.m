//
//  ArchaeologistView.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "ArchaeologistView.h"

@implementation ArchaeologistView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"people" ofType:@"json"];
        NSError *error = nil;
        NSDictionary *peopleJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingMutableContainers error:&error];
        
        path = [[NSBundle mainBundle] pathForResource:@"images" ofType:@"json"];
        error = nil;
        NSDictionary *imagesJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingMutableContainers error:&error];

        self.locationManager.delegate = self;
        [self.locationManager startUpdatingLocation];
        for(NSDictionary *dict in peopleJson) {
            CLCircularRegion *region = [self dictionaryToRegion:dict andType:@"person"];
            NSLog(@"%@", region);
            [self.geofences addObject:region];
            [self.locationManager startMonitoringForRegion:region];
        }
        
        for(NSDictionary *dict in imagesJson) {
            CLCircularRegion *region = [self dictionaryToRegion:dict andType:@"image"];
            NSLog(@"%@", region);
            [self.geofences addObject:region];
            [self.locationManager startMonitoringForRegion:region];
        }
        
        NSSet *setOfRegions = [self.locationManager monitoredRegions];
        for (CLCircularRegion *region in setOfRegions) {
            NSLog (@"region info: %@", region);
        }
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"archeoloog_bg"]];
        
        self.digField = [[UIImageView alloc] initWithFrame:self.bounds];
        self.digField.backgroundColor = [UIColor clearColor];
        
        /* Object button */
        
        self.btnObject = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *btnObjectImage = [UIImage imageNamed:@"brief_btn"];
        [self.btnObject setBackgroundImage:btnObjectImage forState:UIControlStateNormal];
        self.btnObject.frame = CGRectMake(0, 0, btnObjectImage.size.width, btnObjectImage.size.height);
        self.btnObject.center = CGPointMake(self.frame.size.width / 2, 100);
        [self addSubview:self.btnObject];
        
        [self addSubview:self.digField];
       
        /* Info Label */
        
        UIColor *txtColor = [UIColor colorWithRed:1.0f green: 1.0f blue:1.0f alpha:.4];
        
        self.lblInfo = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width / 2) - 125, self.frame.size.height - 50, 250, 30)];
        self.lblInfo.text = @"Graaf de objecten op";
        self.lblInfo.textColor = txtColor;
        self.lblInfo.textAlignment = NSTextAlignmentCenter;
        self.lblInfo.font = [UIFont fontWithName:@"Avenir Next" size:18];
        [self addSubview:self.lblInfo];
    
        
        /* drawing code */
        
        [self.digField.image drawInRect:self.digField.bounds];
        
        CGSize size;
        size.height = self.digField.bounds.size.height;
        size.width = self.digField.bounds.size.width;
        
        UIGraphicsBeginImageContext(size);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetRGBFillColor(context, 0.35, 0.24, 0.11, 1.0);
        CGContextFillRect(context, self.digField.bounds);
        
        self.digField.image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
    }
    return self;
}

- (CLCircularRegion*)dictionaryToRegion:(NSDictionary*)dictionary andType:(NSString *)type {
    int identifier = [[dictionary valueForKey:@"identifier"] floatValue];
    
    CLLocationDegrees latitude = [[dictionary valueForKey:@"latitude"] doubleValue];
    CLLocationDegrees longitude =[[dictionary valueForKey:@"longitude"] doubleValue];
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(latitude, longitude);
    
    return [[CLCircularRegion alloc] initWithCenter:centerCoordinate radius:50.f identifier:[NSString stringWithFormat:@"%@%i", type, identifier]];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLCircularRegion *)region {
    NSLog(@"enter hell");
    [self showRegionAlert:@"Entering Region" forRegion:region.identifier];
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLCircularRegion *)region {
    NSLog(@"exit hell");
    [self showRegionAlert:@"Exiting Region" forRegion:region.identifier];
}

-(void)showRegionAlert:(NSString *)message forRegion:(NSString *)region {
    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:region message:message delegate:self cancelButtonTitle:@"Oké" otherButtonTitles:nil];
    [alertV show];
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLCircularRegion *)region {
    NSLog(@"Started monitoring %@ region", region.identifier);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialize Location Manager
    self.locationManager = [[CLLocationManager alloc] init];
    
    // Configure Location Manager
    [self.locationManager setDelegate:self];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    
    self.geofences = [NSMutableArray arrayWithArray:[[self.locationManager monitoredRegions] allObjects]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    UITouch *touch = [touches anyObject];
    
    if ([touch tapCount] == 2) {
        return;
    }
    
    self.userPoint = [touch locationInView:self.digField];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.digField];
    UIGraphicsBeginImageContext(self.digField.frame.size);
    
    [self.digField.image drawInRect:self.digField.bounds];
    
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeClear);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 30.0);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), self.userPoint.x, self.userPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    self.digField.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.userPoint = currentPoint;
}

@end
