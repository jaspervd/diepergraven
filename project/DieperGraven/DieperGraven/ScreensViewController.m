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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
