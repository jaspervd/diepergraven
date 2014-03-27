//
//  CanvasView.h
//  DieperGraven
//
//  Created by Niels Boey on 27/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CanvasView : UIView

@property (strong, nonatomic) UIBezierPath *path;
@property (strong, nonatomic) UIColor *brush;

@property (strong, nonatomic) NSMutableArray *arrPaths;
@property (strong, nonatomic) NSMutableArray *arrBuffer;

@end