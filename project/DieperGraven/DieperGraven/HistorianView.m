//
//  HistorianView.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "HistorianView.h"

@implementation HistorianView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"historicus_bg"]];
        
        UIColor *txtColor = [UIColor colorWithRed:0/255.0f green: 0/255.0f blue:0/255.0f alpha:.4];
        
        self.lblInfo = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width / 2) - 150, self.frame.size.height - 50, 300, 30)];
        self.lblInfo.text = @"Bekijk de gevonden documenten";
        self.lblInfo.textColor = txtColor;
        self.lblInfo.textAlignment = NSTextAlignmentCenter;
        self.lblInfo.font = [UIFont fontWithName:@"Avenir Next" size:18];
        [self addSubview:self.lblInfo];
        
        
    }
    return self;
}


@end
