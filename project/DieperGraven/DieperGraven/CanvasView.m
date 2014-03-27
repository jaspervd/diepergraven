//
//  CanvasView.m
//  DieperGraven
//
//  Created by Niels Boey on 27/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "CanvasView.h"

@implementation CanvasView

- (id)initWithFrame:(CGRect)frame color:(float)color andSize:(float)size
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.brushColor = color;
        self.brushSize = size;
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tekenaar_bg"]];
    
        self.arrPaths = [[NSMutableArray alloc] init];
        self.arrBuffer = [[NSMutableArray alloc] init];
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    //[self.brush setStroke];
    for (NSMutableDictionary *dic in self.arrPaths) {
        UIBezierPath *path = [dic valueForKey:@"path"];
        [[dic valueForKey:@"color"] setStroke];
        [path strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
    }
    // Drawing code
    //[myPath stroke];
    
}

#pragma mark - Touch Methods
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    self.path = [[UIBezierPath alloc] init];
    self.path.lineCapStyle = kCGLineCapRound;
    self.path.lineWidth = self.brushSize;
    self.path.miterLimit = 0;
    
    self.brush = [UIColor colorWithHue:self.brushColor/255 saturation:.7 brightness:1 alpha:.7];
 
    
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    [self.path moveToPoint:[mytouch locationInView:self]];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:self.brush forKey:@"color"];
    [dic setObject:self.path forKey:@"path"];
    [self.arrPaths addObject:dic];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *mytouch=[[touches allObjects] objectAtIndex:0];
    [self.path addLineToPoint:[mytouch locationInView:self]];
    [self setNeedsDisplay];
}


@end
