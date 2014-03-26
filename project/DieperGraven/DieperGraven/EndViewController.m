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

- (id)initWithTeam:(Team *)team andScores:(NSMutableArray *)scores {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.team = team;
        self.scores = scores;
    }
    return self;
}

- (void)loadView {
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[EndView alloc] initWithFrame:bounds Team:self.team andScores:self.scores];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"team_name": self.team.name, @"objects": @"15", @"time": @"01:23:43"};
    [manager POST:@"http://localhost/MAIV/api/scores/" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
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
