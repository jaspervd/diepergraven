//
//  DraftsmanView.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasView.h"

@interface DraftsmanView : UIView

@property (strong, nonatomic) UILabel *lblInfo;

@property (strong, nonatomic) UISlider *sliderStroke;
@property (strong, nonatomic) UISlider *sliderColor;
@property (strong, nonatomic) UIView *colorPreview;

@property (strong, nonatomic) CanvasView *canvas;
@property (strong, nonatomic) UIButton *saveBtn;
@property (strong, nonatomic) UIButton *clearBtn;

@end
