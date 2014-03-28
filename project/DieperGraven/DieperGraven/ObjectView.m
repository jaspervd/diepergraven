//
//  ObjectView.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 28/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "ObjectView.h"

@implementation ObjectView

- (id)initWithFrame:(CGRect)frame andIdentifier:(NSString *)identifier
{
    self = [super initWithFrame:frame];
    if (self) {
        self.identifier = identifier;
        self.btnObject = [[UIButton alloc] init];
        self.btnObject = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *btnObjectImage = [UIImage imageNamed:@"brief_btn"];
        [self.btnObject setBackgroundImage:btnObjectImage forState:UIControlStateNormal];
        self.btnObject.frame = self.frame;
        [self addSubview:self.btnObject];
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
