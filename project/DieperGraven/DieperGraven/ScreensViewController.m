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
    
    [self.view.archaeologistV.btnObject addTarget:self action:@selector(objectTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.draftsmanV.saveBtn addTarget:self action:@selector(saveImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.draftsmanV.clearBtn addTarget:self action:@selector(clearImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.leftBarV.btnStop addTarget:self action:@selector(stopWalk:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)stopWalk:(id)sender {
    
    NSDate *endDate = [NSDate date];
    
     /*NSLog(@"%@ start datum ",self.view.leftBarV.startDate);
     NSLog(@"%@ eind datum ",endDate);*/

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
    
    if( self.view.leftBarV.objects == 1){
        NSString *objectsTxt = [NSString stringWithFormat:@"%d object", self.view.leftBarV.objects];
        self.view.leftBarV.lblObjects.text = objectsTxt;
    }else {
        NSString *objectsTxt = [NSString stringWithFormat:@"%d objecten", self.view.leftBarV.objects];
        self.view.leftBarV.lblObjects.text = objectsTxt;
    }

    //[self.view.archaeologistV.btnObject removeFromSuperview];
}

- (void)saveImage:(id)sender {
    
    UIGraphicsBeginImageContext(self.view.draftsmanV.canvas.bounds.size);
    [self.view.draftsmanV.canvas.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didExportWithError:contextInfo:), nil);
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
