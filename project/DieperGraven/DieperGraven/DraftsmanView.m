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
        
        self.sliderStroke = [[UISlider alloc] initWithFrame:CGRectMake(50, self.frame.size.height - 50, 250, 30)];
        self.sliderStroke.minimumValue = 2;
        self.sliderStroke.maximumValue = 50;
        [self addSubview:self.sliderStroke];
        
        self.saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *saveBtnImage = [UIImage imageNamed:@"save_btn"];
        [self.saveBtn setBackgroundImage:saveBtnImage forState:UIControlStateNormal];
        self.saveBtn.frame = CGRectMake(0, 0, saveBtnImage.size.width, saveBtnImage.size.height);
        self.saveBtn.center = CGPointMake( self.frame.size.width - 50, self.frame.size.height - 50);
        [self addSubview:self.saveBtn];
        
        self.sliderColor = [[UISlider alloc] initWithFrame:CGRectMake(self.frame.size.width - 300, self.frame.size.height - 50, 250, 30)];
        self.sliderColor.minimumValue = 0;
        self.sliderColor.maximumValue = 255;
        [self addSubview:self.sliderColor];
        [self.sliderColor addTarget:self action:@selector(sliderColorMove:) forControlEvents:UIControlEventValueChanged];
        
        self.colorPreview = [[UIView alloc] initWithFrame:CGRectMake(self.sliderColor.frame.origin.x + self.sliderColor.frame.size.width + 10, self.sliderColor.frame.origin.y + 7, 16, 16)];
        self.colorPreview.backgroundColor = [UIColor colorWithHue:self.sliderColor.value/255 saturation:.7 brightness:1 alpha:.7];
        [self addSubview:self.colorPreview];

        self.arrPaths = [[NSMutableArray alloc] init];
        self.arrBuffer = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)sliderColorMove:(id)sender {
    self.colorPreview.backgroundColor = [UIColor colorWithHue:self.sliderColor.value/255 saturation:.7 brightness:1 alpha:.7];
}

/*
 -(void)undoBtnClicked
 {
 if([self.arrPaths count] > 0){
 UIBezierPath *path = [self.arrPaths lastObject];
 [self.arrBuffer addObject:path];
 [self.arrPaths removeLastObject];
 [self setNeedsDisplay];
 }
 }
 
 -(void)redoBtnClicked
 {
 if([self.arrBuffer count] > 0){
 UIBezierPath *path = [self.arrBuffer lastObject];
 [self.arrPaths addObject:path];
 [self.arrBuffer removeLastObject];
 [self setNeedsDisplay];
 }
 }
 
 */

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
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
    self.path.lineWidth = self.sliderStroke.value;
    self.path.lineCapStyle = kCGLineCapRound;
    self.path.miterLimit = 0;

    self.brush = [UIColor colorWithHue:self.sliderColor.value/255 saturation:.7 brightness:1 alpha:.7];
    
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
