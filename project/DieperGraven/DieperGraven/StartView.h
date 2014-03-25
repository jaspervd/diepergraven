//
//  StartView.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 25/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartView : UIView

@property (strong, nonatomic) UITextField *txtTeamname;
@property (strong, nonatomic) UITextField *txtArchaeologist;
@property (strong, nonatomic) UITextField *txtHistorian;
@property (strong, nonatomic) UITextField *txtGeologist;
@property (strong, nonatomic) UITextField *txtDraftsman;
@property (strong, nonatomic) UIButton *btnContinue;

@end
