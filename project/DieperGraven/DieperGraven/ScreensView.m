//
//  ScreensView.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "ScreensView.h"

@implementation ScreensView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.leftBarV = [[LeftBarView alloc] initWithFrame:CGRectMake(0, 0, 310, self.frame.size.width)];
        [self addSubview:self.leftBarV];
        
        CGRect screenFrame = CGRectMake(self.leftBarV.frame.size.width, 0, (self.frame.size.height - 310), self.frame.size.width);
        self.mapBoxV = [[MapBoxView alloc] initWithFrame:screenFrame];
        [self addSubview:self.mapBoxV];
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
