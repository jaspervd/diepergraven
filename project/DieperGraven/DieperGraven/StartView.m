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
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_bg"]];
        
        UIColor *txtColor = [UIColor colorWithRed:255/255.0f green: 255/255.0f blue:255/255.0f alpha:.6];
        
        
        UIImageView *title = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"titel"]];
        title.frame = CGRectMake(0, 0, title.frame.size.width, title.frame.size.height);
        title.center = CGPointMake(self.frame.size.height / 2, 104);
        [self addSubview:title];
        
        
        /* Teamname */
        
        self.txtTeamname = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 600, 44)];
        self.txtTeamname.center = CGPointMake(self.frame.size.height / 2, title.frame.origin.y + title.frame.size.height + 70);
        self.txtTeamname.placeholder = @"Team naam";
        self.txtTeamname.backgroundColor = txtColor;
        self.txtTeamname.font = [UIFont fontWithName:@"Avenir Next" size:16];
        [self addSubview:self.txtTeamname];
        
        
        /* Archaeologist item + text */
        
        UIImageView *imgArchaeologist = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"archeoloog"]];
        imgArchaeologist.frame = CGRectMake(175, 300, imgArchaeologist.frame.size.width, imgArchaeologist.frame.size.height);
        [self addSubview:imgArchaeologist];
        
        self.txtArchaeologist = [[UITextField alloc] initWithFrame:CGRectMake(imgArchaeologist.frame.origin.x, imgArchaeologist.frame.origin.y + imgArchaeologist.frame.size.height + 20 , 135, 30)];
        self.txtArchaeologist.placeholder = @"Archeoloog";
        self.txtArchaeologist.backgroundColor = txtColor;
        self.txtArchaeologist.font = [UIFont fontWithName:@"Avenir Next" size:16];
        [self addSubview:self.txtArchaeologist];
        
        /* Historian item + text */
        
        UIImageView *imgHistorian = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"historicus"]];
        imgHistorian.frame = CGRectMake(imgArchaeologist.frame.origin.x + (imgArchaeologist.frame.size.width) + 50, 306, imgHistorian.frame.size.width, imgHistorian.frame.size.height);
        [self addSubview:imgHistorian];
        
        self.txtHistorian = [[UITextField alloc] initWithFrame:CGRectMake(imgHistorian.frame.origin.x, self.txtArchaeologist.frame.origin.y , 135, 30)];
        self.txtHistorian.placeholder = @"Historicus";
        self.txtHistorian.backgroundColor = txtColor;
        self.txtHistorian.font = [UIFont fontWithName:@"Avenir Next" size:16];
        [self addSubview:self.txtHistorian];
        
        /* Geologist item + text */
        
        UIImageView *imgGeologist = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"geoloog"]];
        imgGeologist.frame = CGRectMake(imgHistorian.frame.origin.x + (imgHistorian.frame.size.width) + 50, 306, imgGeologist.frame.size.width, imgGeologist.frame.size.height);
        [self addSubview:imgGeologist];
        
        self.txtGeologist = [[UITextField alloc] initWithFrame:CGRectMake(imgGeologist.frame.origin.x, self.txtArchaeologist.frame.origin.y , 135, 30)];
        self.txtGeologist.placeholder = @"Geoloog";
        self.txtGeologist.backgroundColor = txtColor;
        self.txtGeologist.font = [UIFont fontWithName:@"Avenir Next" size:16];
        [self addSubview:self.txtGeologist];
        
        /* Draftsman item + text */
        
        UIImageView *imgDraftsman = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tekenaar"]];
        imgDraftsman.frame = CGRectMake(imgGeologist.frame.origin.x + (imgGeologist.frame.size.width) + 50, 300, imgDraftsman.frame.size.width, imgDraftsman.frame.size.height);
        [self addSubview:imgDraftsman];
        
        self.txtDraftsman = [[UITextField alloc] initWithFrame:CGRectMake(imgDraftsman.frame.origin.x, self.txtArchaeologist.frame.origin.y , 135, 30)];
        self.txtDraftsman.placeholder = @"Tekenaar";
        self.txtDraftsman.backgroundColor = txtColor;
        self.txtDraftsman.font = [UIFont fontWithName:@"Avenir Next" size:16];
        [self addSubview:self.txtDraftsman];
        
        
        /* Continue button */
        
        self.btnContinue = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *btnContinueImage = [UIImage imageNamed:@"start_btn"];
        [self.btnContinue setBackgroundImage:btnContinueImage forState:UIControlStateNormal];
        self.btnContinue.frame = CGRectMake(0, 0, btnContinueImage.size.width, btnContinueImage.size.height);
        self.btnContinue.center = CGPointMake(self.frame.size.height / 2, 650);
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
