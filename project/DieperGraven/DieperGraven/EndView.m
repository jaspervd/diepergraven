//
//  EndView.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "EndView.h"

@implementation EndView

- (id)initWithFrame:(CGRect)frame Team:(Team *)team time:(NSDate *)time andScore:(int)score
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_bg"]];
        
        self.score = score;
        self.time = time;
        
        NSLog(@"Team: %@", team.name);
        NSLog(@"Time: %@", self.time);
        NSLog(@"Score: %i", self.score);
       
       /* for (Team *nTeam in scores) {
            NSLog(@"%@", nTeam.name);
        }*/
        
        
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm:ss"];
        
        //Optionally for time zone converstions
        [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
        
        NSString *stringFromDate = [formatter stringFromDate:self.time];
        NSLog(@"%@",stringFromDate);
        
        

        
        self.lblTime = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.height / 2)-200, 220, 400, 50)];
        self.lblTime.textAlignment = NSTextAlignmentCenter;
        self.lblTime.textColor = [UIColor whiteColor];
        self.lblTime.font = [UIFont fontWithName:@"DINCondensed-Bold" size:50];
        self.lblTime.text = stringFromDate;
        [self addSubview:self.lblTime];

        
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.height / 2)-200, 180, 400, 30)];
        label.text = @"wandel tijd";
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont fontWithName:@"Avenir Next Medium" size:25];
        [self addSubview:label];
        
        
        NSString *scoreToString = [NSString stringWithFormat:@"%i",self.score];
        
        self.lblScore = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.height / 2)-200, 320, 400, 50)];
        self.lblScore.textAlignment = NSTextAlignmentCenter;
        self.lblScore.textColor = [UIColor whiteColor];
        self.lblScore.font = [UIFont fontWithName:@"DINCondensed-Bold" size:50];
        self.lblScore.text = scoreToString;
        [self addSubview:self.lblScore];
        
        UILabel *labelS = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.height / 2)-200, 280, 400, 30)];
        labelS.text = @"aantal verzamelde objecten";
        labelS.textColor = [UIColor whiteColor];
        labelS.textAlignment = NSTextAlignmentCenter;
        labelS.font = [UIFont fontWithName:@"Avenir Next Medium" size:25];
        [self addSubview:labelS];
        
        self.btnUpload = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *btnUploadImage = [UIImage imageNamed:@"upload_btn"];
        [self.btnUpload setBackgroundImage:btnUploadImage forState:UIControlStateNormal];
        self.btnUpload.frame = CGRectMake((self.frame.size.height / 2) - (btnUploadImage.size.width/2), 540, btnUploadImage.size.width, btnUploadImage.size.height);
        [self addSubview:self.btnUpload];
        
        self.btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *btnBackImage = [UIImage imageNamed:@"back_btn"];
        [self.btnBack setBackgroundImage:btnBackImage forState:UIControlStateNormal];
        self.btnBack.frame = CGRectMake((self.frame.size.height / 2) - (btnBackImage.size.width/2), self.btnUpload.frame.origin.y + self.btnUpload.frame.size.height + 10, btnBackImage.size.width, btnBackImage.size.height);
        [self addSubview:self.btnBack];
        
        
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
