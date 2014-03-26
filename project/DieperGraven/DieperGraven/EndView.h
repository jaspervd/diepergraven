//
//  EndView.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Team.h"

@interface EndView : UIView

- (id)initWithFrame:(CGRect)frame Team:(Team *)team andScores:(NSMutableArray *)scores;

@end
