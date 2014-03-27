//
//  ArchaeologistView.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "ArchaeologistView.h"

@implementation ArchaeologistView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"archeoloog_bg"]];
        
        self.digField = [[UIImageView alloc] initWithFrame:self.bounds];
        self.digField.backgroundColor = [UIColor clearColor];
        
        /* Object button */
        
        self.btnObject = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *btnObjectImage = [UIImage imageNamed:@"brief_btn"];
        [self.btnObject setBackgroundImage:btnObjectImage forState:UIControlStateNormal];
        self.btnObject.frame = CGRectMake(0, 0, btnObjectImage.size.width, btnObjectImage.size.height);
        self.btnObject.center = CGPointMake(self.frame.size.width / 2, 100);
        [self addSubview:self.btnObject];
        
        [self addSubview:self.digField];
       
        /* Info Label */
        
        UIColor *txtColor = [UIColor colorWithRed:255/255.0f green: 255/255.0f blue:255/255.0f alpha:.4];
        
        self.lblInfo = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width / 2) - 125, self.frame.size.height - 50, 250, 30)];
        self.lblInfo.text = @"Graaf de objecten op";
        self.lblInfo.textColor = txtColor;
        self.lblInfo.textAlignment = NSTextAlignmentCenter;
        self.lblInfo.font = [UIFont fontWithName:@"Avenir Next" size:18];
        [self addSubview:self.lblInfo];
    
        
        /* drawing code */
        
        [self.digField.image drawInRect:self.digField.bounds];
        
        CGSize size;
        size.height = self.digField.bounds.size.height;
        size.width = self.digField.bounds.size.width;
        
        UIGraphicsBeginImageContext(size);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetRGBFillColor(context, 0.35, 0.24, 0.11, 1.0);
        CGContextFillRect(context, self.digField.bounds);
        
        self.digField.image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();

        
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    UITouch *touch = [touches anyObject];
    
    if ([touch tapCount] == 2) {
        return;
    }
    
    self.userPoint = [touch locationInView:self.digField];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.digField];
    UIGraphicsBeginImageContext(self.digField.frame.size);
    
    [self.digField.image drawInRect:self.digField.bounds];
    
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeClear);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 30.0);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), self.userPoint.x, self.userPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    self.digField.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.userPoint = currentPoint;
}

@end
