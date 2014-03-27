//
//  LeftBarView.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "LeftBarView.h"

@implementation LeftBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sidebar_bg"]];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTick:) userInfo:nil repeats:YES];
        
        CGRect infoRect = CGRectMake(0, 0, self.frame.size.width, 40);
        
        UIFont *lblFont = [UIFont fontWithName:@"DINCondensed-Bold" size:36];
        UIColor *lblColor = [UIColor colorWithRed:0.33 green:0.34 blue:0.29 alpha:1];
        
        self.lblTime = [[UILabel alloc] initWithFrame:infoRect];
        self.lblTime.textAlignment = NSTextAlignmentCenter;
        self.lblTime.textColor = lblColor;
        self.lblTime.font = lblFont;
        self.lblTime.text = [NSString stringWithFormat:@"00:00"];
        self.lblTime.center = CGPointMake(self.frame.size.width / 2, 80);
        [self addSubview:self.lblTime];
        
        self.lblObjects = [[UILabel alloc] initWithFrame:infoRect];
        self.lblObjects.textAlignment = NSTextAlignmentCenter;
        self.lblObjects.textColor = lblColor;
        self.lblObjects.font = [UIFont fontWithName:@"DINCondensed-Bold" size:30];
        self.lblObjects.text = [NSString stringWithFormat:@"0 objecten"];
        self.lblObjects.center = CGPointMake(self.frame.size.width / 2, 120);
        [self addSubview:self.lblObjects];
        
        UIImage *btnArchaeologistImage = [UIImage imageNamed:@"archeoloog_btn"];
        self.btnArchaeologist = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnArchaeologist setBackgroundImage:btnArchaeologistImage forState:UIControlStateNormal];
        self.btnArchaeologist.frame = CGRectMake(0, 178, btnArchaeologistImage.size.width, btnArchaeologistImage.size.height);
        [self addSubview:self.btnArchaeologist];
        
        
        UIImage *btnHistorianImage = [UIImage imageNamed:@"historicus_btn"];
        self.btnHistorian = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnHistorian setBackgroundImage:btnHistorianImage forState:UIControlStateNormal];
        self.btnHistorian.frame = CGRectMake(0, 323, btnHistorianImage.size.width, btnHistorianImage.size.height);
        [self addSubview:self.btnHistorian];
        
        
        UIImage *btnGeologistImage = [UIImage imageNamed:@"geoloog_btn"];
        self.btnGeologist = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnGeologist setBackgroundImage:btnGeologistImage forState:UIControlStateNormal];
        self.btnGeologist.frame = CGRectMake(0, 478, btnGeologistImage.size.width, btnGeologistImage.size.height);
        [self addSubview:self.btnGeologist];
        
        
        UIImage *btnDraftsmanImage = [UIImage imageNamed:@"tekenaar_btn"];
        self.btnDraftsman = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnDraftsman setBackgroundImage:btnDraftsmanImage forState:UIControlStateNormal];
        self.btnDraftsman.frame = CGRectMake(0, 625, btnDraftsmanImage.size.width, btnDraftsmanImage.size.height);
        [self addSubview:self.btnDraftsman];
    }
    return self;
}

- (void)timerTick:(NSTimer *)timer {
    NSDate *now = [NSDate date];
    
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"HH:mm:ss";  // very simple format  "8:47:22 AM"
    }
    self.lblTime.text = [dateFormatter stringFromDate:now];
}

@end
