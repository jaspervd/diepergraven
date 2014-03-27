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

@property int score;
@property (strong, nonatomic) NSDate *time;

@property (nonatomic,strong) UILabel *lblTime;
@property (nonatomic,strong) UILabel *lblScore;

@property (nonatomic,strong) UIButton *btnUpload;
@property (nonatomic,strong) UIButton *btnBack;

- (id)initWithFrame:(CGRect)frame Team:(Team *)team time:(NSDate *)time andScore:(int)score;

@end
