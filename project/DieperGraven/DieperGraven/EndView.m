//
//  EndView.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "EndView.h"

@implementation EndView

- (id)initWithFrame:(CGRect)frame Team:(Team *)team andScores:(NSMutableArray *)scores
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor= [UIColor purpleColor];
        NSLog(@"Team:");
        NSLog(@"%@", team.name);
        NSLog(@"Scores:");
        for (Team *nTeam in scores) {
            NSLog(@"%@", nTeam.name);
        }
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
