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
    
    NSString *path = @"http://localhost/MAIV/api/scores";
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *loadedData = (NSArray *)responseObject;
        self.scores = [NSMutableArray array];
        for (NSDictionary *dict in loadedData) {
            Team *team = [TeamFactory createTeamFromDictionary:dict];
            [self.scores addObject:team];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Probleem met DieperGraven API" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Oké" otherButtonTitles:nil];
        [alertView show];
    }];
    [operation start];
    
    [self.view.btnContinue addTarget:self action:@selector(continueTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)continueTapped:(id)sender {
    if(self.view.txtTeamname.text.length > 0 && self.view.txtArchaeologist.text.length > 0 && self.view.txtHistorian.text.length > 0 && self.view.txtGeologist.text.length > 0 && self.view.txtDraftsman.text.length > 0) {
        Team *team = [TeamFactory createTeamWithName:self.view.txtTeamname.text Archaeologist:self.view.txtArchaeologist.text Historian:self.view.txtHistorian.text Geologist:self.view.txtGeologist.text Draftsman:self.view.txtDraftsman.text Objects:0 andTime:nil];
        
        ScreensViewController *screensVC = [[ScreensViewController alloc] initWithTeam:team];
        [self presentViewController:screensVC animated:NO completion:^{}];
    } else {
        UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"Fout" message:@"Gelieve alle velden in te vullen." delegate:self cancelButtonTitle:@"Oké" otherButtonTitles:nil];
        [alertV show];
    }
    //[self.delegate mapBoxVC:self didSaveTeam:team];
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
