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
   // NSDictionary *parameters = @{@"team_name": @"naam", @"objects": @"4", @"time": @"00:53"};

    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:@"http://localhost/MAIV/api/scores/" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        UIAlertView *alertSuccess = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Je gegevens zijn correct doorgestuurd." delegate:self cancelButtonTitle:@"Oké" otherButtonTitles:nil];
        [alertSuccess show];
        
        [self.view.btnUpload removeFromSuperview];
        
       /* CGAffineTransform trans = CGAffineTransformTranslate(self.view.transform, self.view.frame.size.height, self.view.frame.size.width);
        [UIView animateWithDuration:0.7 delay:0 options:0 animations:^{
            self.view.btnUpload.transform = trans;
        } completion:^(BOOL finished) {
            [self.view.btnUpload removeFromSuperview];
        }];*/
        
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
