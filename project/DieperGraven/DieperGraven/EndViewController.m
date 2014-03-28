//
//  EndViewController.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "EndViewController.h"

@interface EndViewController ()

@end

@implementation EndViewController

- (id)initWithTeam:(Team *)team time:(NSDate *)time andScore:(int)score {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.team = team;
        self.score = score;
        self.time = time;
        
        self.uploadScore = [NSString stringWithFormat:@"%i", self.score];
        self.uploadTime = [NSString stringWithFormat:@"%@", self.time];
    }
    return self;
}

- (void)loadView {
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[EndView alloc] initWithFrame:bounds Team:self.team time:self.time andScore:self.score];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    [self.view.btnBack addTarget:self action:@selector(backTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view.btnUpload addTarget:self action:@selector(uploadTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)backTapped:(id)sender {

        StartViewController *startVC = [[StartViewController alloc]init];
        [self presentViewController:startVC animated:YES completion:^{}];
}

- (void)uploadTapped:(id)sender {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"team_name": self.team.name, @"objects": self.uploadScore, @"time": self.uploadTime};

    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:@"http://student.howest.be/niels.boey/MAIV/api/scores" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        UIAlertView *alertSuccess = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Je gegevens zijn correct doorgestuurd." delegate:self cancelButtonTitle:@"Oké" otherButtonTitles:nil];
        [alertSuccess show];
        
        [self.view.btnUpload removeFromSuperview];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        UIAlertView *alertError = [[UIAlertView alloc] initWithTitle:@"Fout" message:@"We kunnen je gegevens op dit moment niet uploaden." delegate:self cancelButtonTitle:@"Terug" otherButtonTitles:nil];
        [alertError show];
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
