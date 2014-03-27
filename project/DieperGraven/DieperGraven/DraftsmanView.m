//
//  DraftsmanView.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "DraftsmanView.h"

@implementation DraftsmanView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tekenaar_bg"]];
        
        UIColor *txtColor = [UIColor colorWithRed:0/255.0f green: 0/255.0f blue:0/255.0f alpha:.4];
        
        self.lblInfo = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width / 2) - 125, self.frame.size.height - 50, 250, 30)];
        self.lblInfo.text = @"Teken het monument";
        self.lblInfo.textColor = txtColor;
        self.lblInfo.textAlignment = NSTextAlignmentCenter;
        self.lblInfo.font = [UIFont fontWithName:@"Avenir Next" size:18];
        [self addSubview:self.lblInfo];
        
        self.path = [[UIBezierPath alloc]init];
        self.path.lineCapStyle = kCGLineCapRound;
        self.path.miterLimit = 0;
        self.path.lineWidth = 10;
        self.brush = [UIColor redColor];
        
        
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self.brush setStroke];
    [self.path strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
    // Drawing code
    //[myPath stroke];
}

#pragma mark - Touch Methods
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    [self.path moveToPoint:[mytouch locationInView:self]];
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    [self.path addLineToPoint:[mytouch locationInView:self]];
    [self setNeedsDisplay];
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    
}

@end
