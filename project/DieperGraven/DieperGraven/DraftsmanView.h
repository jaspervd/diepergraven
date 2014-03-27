//
//  DraftsmanView.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DraftsmanView : UIView

@property (strong, nonatomic) UILabel *lblInfo;
@property (strong, nonatomic) UIBezierPath *path;
@property (strong, nonatomic) UIColor *brush;
@property (strong, nonatomic) UISlider *sliderStroke;
@property (strong, nonatomic) UISlider *sliderColor;
@property (strong, nonatomic) UIView *colorPreview;
@property (strong, nonatomic) NSMutableArray *arrPaths;
@property (strong, nonatomic) NSMutableArray *arrBuffer;

@end
