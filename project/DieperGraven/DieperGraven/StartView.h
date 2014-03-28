//
//  StartView.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 25/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartView : UIView

@property (strong, nonatomic) UILabel *lblArchaeologist;
@property (strong, nonatomic) UILabel *lblHistorian;
@property (strong, nonatomic) UILabel *lblGeologist;
@property (strong, nonatomic) UILabel *lblDraftsman;

@property (strong, nonatomic) UITextField *txtTeamname;
@property (strong, nonatomic) UIButton *btnContinue;

@end
