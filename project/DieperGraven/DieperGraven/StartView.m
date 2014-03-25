//
//  StartView.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 25/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "StartView.h"

@implementation StartView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:200/255.0f green: 200/255.0f blue:200/255.0f alpha:1];
        
        UIColor *txtColor = [UIColor whiteColor];
        
        self.txtTeamname = [[UITextField alloc] initWithFrame:CGRectMake(350, 15, 600, 44)];
        self.txtTeamname.placeholder = @"Team naam";
        self.txtTeamname.backgroundColor = txtColor;
        [self addSubview:self.txtTeamname];
        
        self.txtArchaeologist = [[UITextField alloc] initWithFrame:CGRectMake(245, 50, 100, 44)];
        self.txtArchaeologist.placeholder = @"Archeoloog";
        self.txtArchaeologist.backgroundColor = txtColor;
        [self addSubview:self.txtArchaeologist];
        
        self.txtHistorian = [[UITextField alloc] initWithFrame:CGRectMake(self.txtArchaeologist.frame.origin.x + self.txtArchaeologist.frame.size.width + 15, self.txtArchaeologist.frame.origin.y, 100, 44)];
        self.txtHistorian.placeholder = @"Historicus";
        self.txtHistorian.backgroundColor = txtColor;
        [self addSubview:self.txtHistorian];
        
        self.txtGeologist = [[UITextField alloc] initWithFrame:CGRectMake(self.txtHistorian.frame.origin.x + self.txtHistorian.frame.size.width + 15, self.txtArchaeologist.frame.origin.y, 100, 44)];
        self.txtGeologist.placeholder = @"Geoloog";
        self.txtGeologist.backgroundColor = txtColor;
        [self addSubview:self.txtGeologist];
        
        self.txtDraftsman = [[UITextField alloc] initWithFrame:CGRectMake(self.txtGeologist.frame.origin.x + self.txtGeologist.frame.size.width + 15, self.txtArchaeologist.frame.origin.y, 100, 44)];
        self.txtDraftsman.placeholder = @"Tekenaar";
        self.txtDraftsman.backgroundColor = txtColor;
        [self addSubview:self.txtDraftsman];
        
        self.btnContinue = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.btnContinue setTitle:@"Start wandeling" forState:UIControlStateNormal];
        self.btnContinue.frame = CGRectMake(0, 0, self.frame.size.width - 30, 44);
        self.btnContinue.center = CGPointMake(self.frame.size.width / 2, self.txtDraftsman.center.y + self.txtDraftsman.frame.size.height + 15);
        [self addSubview:self.btnContinue];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
