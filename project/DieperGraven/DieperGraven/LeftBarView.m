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
        self.backgroundColor = [UIColor brownColor];
        
        int btnSize = 140;
        
        self.btnArchaeologist = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnArchaeologist setTitle:@"Archeoloog" forState:UIControlStateNormal];
        self.btnArchaeologist.frame = CGRectMake(0, 208, self.frame.size.width, btnSize);
        [self addSubview:self.btnArchaeologist];
        
        self.btnHistorian = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnHistorian setTitle:@"Historicus" forState:UIControlStateNormal];
        self.btnHistorian.frame = CGRectMake(0, self.btnArchaeologist.frame.origin.y + btnSize, self.frame.size.width, btnSize);
        [self addSubview:self.btnHistorian];
        
        self.btnGeologist = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnGeologist setTitle:@"Geoloog" forState:UIControlStateNormal];
        self.btnGeologist.frame = CGRectMake(0, self.btnHistorian.frame.origin.y + btnSize, self.frame.size.width, btnSize);
        [self addSubview:self.btnGeologist];
        
        self.btnDraftsman = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnDraftsman setTitle:@"Tekenaar" forState:UIControlStateNormal];
        self.btnDraftsman.frame = CGRectMake(0, self.btnGeologist.frame.origin.y + btnSize, self.frame.size.width, btnSize);
        [self addSubview:self.btnDraftsman];
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
