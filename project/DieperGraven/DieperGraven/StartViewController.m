//
//  StartViewController.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 25/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

-(void)loadView {
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[StartView alloc] initWithFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view.btnContinue addTarget:self action:@selector(continueTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)continueTapped:(id)sender {
    NSLog(@"[StartVC] Continue");
    
    Team *team = [TeamFactory createTeamWithName:self.view.txtTeamname.text Archaeologist:self.view.txtArchaeologist.text Historian:self.view.txtHistorian.text Geologist:self.view.txtGeologist.text Draftsman:self.view.txtDraftsman.text Objects:0 andTime:nil];
    
    [self.delegate mapBoxViewController:self didSaveTeam:team];
    //￼￼[self presentViewController:mapBoxVC animated:YES completion:^{}];
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
