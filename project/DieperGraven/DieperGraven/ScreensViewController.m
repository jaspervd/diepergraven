//
//  ScreensViewController.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "ScreensViewController.h"

@interface ScreensViewController ()

@end

@implementation ScreensViewController

- (id)initWithTeam:(Team *)team
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.team = team;
        self.objectsArray = [[NSMutableArray alloc] init];
        self.arrPossibleObjects = [[NSMutableArray alloc] init];
        
        self.geofences = [[NSMutableArray alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"people" ofType:@"json"];
        NSError *error = nil;
        NSDictionary *peopleJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingMutableContainers error:&error];
        
        path = [[NSBundle mainBundle] pathForResource:@"images" ofType:@"json"];
        error = nil;
        NSDictionary *imagesJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingMutableContainers error:&error];
        
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [self.locationManager startUpdatingLocation];
        
        for(NSDictionary *dict in peopleJson) {
            CLCircularRegion *region = [self dictionaryToRegion:dict andType:@"person"];
            [self.geofences addObject:region];
            [self.locationManager startMonitoringForRegion:region];
            [dict setValue:[NSString stringWithFormat:@"person%@", [dict objectForKey:@"identifier"]] forKey:@"identifier"];
            [self.arrPossibleObjects addObject:dict];
        }
        
        for(NSDictionary *dict in imagesJson) {
            CLCircularRegion *region = [self dictionaryToRegion:dict andType:@"image"];
            [self.geofences addObject:region];
            [self.locationManager startMonitoringForRegion:region];
            [dict setValue:[NSString stringWithFormat:@"image%@", [dict objectForKey:@"identifier"]] forKey:@"identifier"];
            [self.arrPossibleObjects addObject:dict];
        }
    }
    return self;
}

- (void)loadView {
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[ScreensView alloc] initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view.leftBarV.btnArchaeologist addTarget:self.view action:@selector(archaeologistTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.leftBarV.btnHistorian addTarget:self.view action:@selector(historianTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.leftBarV.btnGeologist addTarget:self.view action:@selector(geologistTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.leftBarV.btnDraftsman addTarget:self.view action:@selector(draftsmanTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view.archaeologistV.objectV.btnObject addTarget:self action:@selector(objectTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.draftsmanV.saveBtn addTarget:self action:@selector(saveImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.draftsmanV.clearBtn addTarget:self action:@selector(clearImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.draftsmanV.undoBtn addTarget:self action:@selector(undoAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.leftBarV.btnStop addTarget:self action:@selector(stopWalk:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    NSLog(@"hey i moved %@", [locations lastObject]);
}

- (CLCircularRegion*)dictionaryToRegion:(NSDictionary*)dictionary andType:(NSString *)type {
    int identifier = [[dictionary valueForKey:@"identifier"] floatValue];
    
    CLLocationDegrees latitude = [[dictionary valueForKey:@"latitude"] doubleValue];
    CLLocationDegrees longitude =[[dictionary valueForKey:@"longitude"] doubleValue];
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(latitude, longitude);
    
    return [[CLCircularRegion alloc] initWithCenter:centerCoordinate radius:7.f identifier:[NSString stringWithFormat:@"%@%i", type, identifier]];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"Entering: %@", region.identifier);
    [self.view.archaeologistV addObject:region.identifier];
    [self.view.archaeologistV bringSubviewToFront:self.view.archaeologistV.digField];
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"Leaving: %@", region.identifier);
    for(ObjectView *thisObject in self.view.archaeologistV.arrObjectsToShow) {
        if(thisObject.identifier == region.identifier) {
            [self.view.archaeologistV removeObject:thisObject];
        }
        
        //EXECUTE DIGFIELD FILL
    }
}

- (void)stopWalk:(id)sender {
    
    NSDate *endDate = [NSDate date];

    NSTimeInterval timeInterval = [endDate timeIntervalSinceDate:self.view.leftBarV.startDate];
    NSDate *time = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    EndViewController *endVC = [[EndViewController alloc] initWithTeam:self.team time:(time) andScore:self.view.leftBarV.objects];
    [self presentViewController:endVC animated:NO completion:^{}];
    
}

- (void)clearImage:(id)sender {
    [self.view.draftsmanV.canvas erase];
}

- (void)objectTapped:(id)sender {
    NSLog(@"OBJECT TAPPED");
    // send object to historianV
   // [self.view.archaeologistV.digField removeFromSuperview];
    self.view.leftBarV.objects ++;
    
    NSLog(@"%@", sender);
    
    NSString *objectsTxt;
    if( self.view.leftBarV.objects == 1){
        objectsTxt = [NSString stringWithFormat:@"%d object", self.view.leftBarV.objects];
    }else {
        objectsTxt = [NSString stringWithFormat:@"%d objecten", self.view.leftBarV.objects];
    }
    self.view.leftBarV.lblObjects.text = objectsTxt;

    self.view.leftBarV.documentCount++;
    [self.view.leftBarV updateDocumentCount:self.view.leftBarV.documentCount];
    
    [self.objectsArray addObject:@"object"];
    NSLog(@"%@", self.objectsArray);

    [self.view.archaeologistV.objectV removeFromSuperview];
}

- (void)saveImage:(id)sender {
    
    UIGraphicsBeginImageContext(self.view.draftsmanV.canvas.bounds.size);
    [self.view.draftsmanV.canvas.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didExportWithError:contextInfo:), nil);
 
}

- (void)undoAction:(id)sender {
    [self.view.draftsmanV undoAction];
}

- (void)image:(UIImage *)image didExportWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *message = @"Je tekening werd opgeslaan in de Foto's app!";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    
    if (error) {
        message = [NSString stringWithFormat:@"De tekening kon niet worden opgeslaan.\n%@", [error localizedDescription]];
        [alert setMessage:message];
        [alert setCancelButtonIndex:[alert addButtonWithTitle:@"Oké"]];
    } else {
        [alert setCancelButtonIndex:[alert addButtonWithTitle:@"Verder"]];
    }
    
    [alert show];
    alert = nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
