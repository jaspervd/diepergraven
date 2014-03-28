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
        self.startDate = [NSDate date];
        
        CGRect infoRect = CGRectMake(0, 0, self.frame.size.width, 40);
        
        UIFont *lblFont = [UIFont fontWithName:@"DINCondensed-Bold" size:36];
        UIColor *lblColor = [UIColor colorWithRed:0.33 green:0.34 blue:0.29 alpha:1];
        
        self.lblTime = [[UILabel alloc] initWithFrame:infoRect];
        self.lblTime.textAlignment = NSTextAlignmentCenter;
        self.lblTime.textColor = lblColor;
        self.lblTime.font = lblFont;
        self.lblTime.text = [NSString stringWithFormat:@"00:00:00"];
        self.lblTime.center = CGPointMake(self.frame.size.width / 2, 60);
        [self addSubview:self.lblTime];
        
        NSString *objectsTxt = [NSString stringWithFormat:@"%d objecten", self.objects];
        self.lblObjects = [[UILabel alloc] initWithFrame:infoRect];
        self.lblObjects.textAlignment = NSTextAlignmentCenter;
        self.lblObjects.textColor = lblColor;
        self.lblObjects.font = [UIFont fontWithName:@"DINCondensed-Bold" size:30];
        self.lblObjects.text = objectsTxt;
        self.lblObjects.center = CGPointMake(self.frame.size.width / 2, 100);
        [self addSubview:self.lblObjects];
        
        UIImage *btnArchaeologistImage = [UIImage imageNamed:@"archeoloog_btn"];
        self.btnArchaeologist = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnArchaeologist setBackgroundImage:btnArchaeologistImage forState:UIControlStateNormal];
        self.btnArchaeologist.frame = CGRectMake(0, 134, btnArchaeologistImage.size.width, btnArchaeologistImage.size.height);
        [self addSubview:self.btnArchaeologist];
        
        
        UIImage *btnHistorianImage = [UIImage imageNamed:@"historicus_btn"];
        self.btnHistorian = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnHistorian setBackgroundImage:btnHistorianImage forState:UIControlStateNormal];
        self.btnHistorian.frame = CGRectMake(0, 279, btnHistorianImage.size.width, btnHistorianImage.size.height);
        [self addSubview:self.btnHistorian];
        
      /*  self.documentCount = 0;
        
        self.documentCountTxt = [NSString stringWithFormat:@"%i", self.documentCount];
        self.lblDocumentCount = [[UILabel alloc] initWithFrame:CGRectMake(128, self.btnHistorian.frame.origin.y+2, 30, 30)];
        self.lblDocumentCount.textAlignment = NSTextAlignmentCenter;
        self.lblDocumentCount.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:.4];
        self.lblDocumentCount.textColor = lblColor;
        self.lblDocumentCount.font = [UIFont fontWithName:@"Avenir Next" size:16];
        self.lblDocumentCount.text = self.documentCountTxt;
        self.lblDocumentCount.layer.cornerRadius = 25;
        [self addSubview:self.lblDocumentCount];*/
        
        
        UIImage *btnGeologistImage = [UIImage imageNamed:@"geoloog_btn"];
        self.btnGeologist = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnGeologist setBackgroundImage:btnGeologistImage forState:UIControlStateNormal];
        self.btnGeologist.frame = CGRectMake(0, 434, btnGeologistImage.size.width, btnGeologistImage.size.height);
        [self addSubview:self.btnGeologist];
        
        
        UIImage *btnDraftsmanImage = [UIImage imageNamed:@"tekenaar_btn"];
        self.btnDraftsman = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnDraftsman setBackgroundImage:btnDraftsmanImage forState:UIControlStateNormal];
        self.btnDraftsman.frame = CGRectMake(0, 581, btnDraftsmanImage.size.width, btnDraftsmanImage.size.height);
        [self addSubview:self.btnDraftsman];
        
        
        UIImage *btnStopImage = [UIImage imageNamed:@"stop_btn"];
        self.btnStop = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnStop setBackgroundImage:btnStopImage forState:UIControlStateNormal];
        self.btnStop.frame = CGRectMake(0, self.frame.size.height-btnStopImage.size.height, btnStopImage.size.width, btnStopImage.size.height);
        [self addSubview:self.btnStop];

    }
    return self;
}

/*- (void)updateDocumentCount:(int)documentCount {
    
    self.documentCount = documentCount;

    NSString *count = [NSString stringWithFormat:@"%i", self.documentCount];
    self.lblDocumentCount.text = count;
    [self.lblDocumentCount setNeedsDisplay];
}*/

- (void)timerTick:(NSTimer *)timer {
    NSDate *now = [NSDate date];
    
    NSTimeInterval timeInterval = [now timeIntervalSinceDate:self.startDate];
    NSDate *time = [NSDate dateWithTimeIntervalSince1970:(timeInterval-3600)];
    
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"HH:mm:ss";
    }
    self.lblTime.text = [dateFormatter stringFromDate:time];
}

@end
