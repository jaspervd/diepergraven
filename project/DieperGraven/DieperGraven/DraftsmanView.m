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
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIColor *txtColor = [UIColor colorWithRed:0/255.0f green: 0/255.0f blue:0/255.0f alpha:.4];
        
        self.lblInfo = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width / 2) - 125, self.frame.size.height - 50, 250, 30)];
        self.lblInfo.text = @"Teken het monument";
        self.lblInfo.textColor = txtColor;
        self.lblInfo.textAlignment = NSTextAlignmentCenter;
        self.lblInfo.font = [UIFont fontWithName:@"Avenir Next" size:18];
        
        
        self.sliderStroke = [[UISlider alloc] initWithFrame:CGRectMake(50, self.frame.size.height - 50, 250, 30)];
        self.sliderStroke.minimumValue = 2;
        self.sliderStroke.maximumValue = 50;
        
        UILabel *lblSize = [[UILabel alloc] initWithFrame:CGRectMake( self.sliderStroke.frame.origin.x, self.sliderStroke.frame.origin.y + 12, self.sliderStroke.frame.size.width, self.sliderStroke.frame.size.height)];
        lblSize.text = @"dikte potlood";
        lblSize.textColor = txtColor;
        lblSize.textAlignment = NSTextAlignmentCenter;
        lblSize.font = [UIFont fontWithName:@"Avenir Next" size:12];
        
        
       // self.canvas.path.lineWidth = self.sliderStroke.value;
        
        self.saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *saveBtnImage = [UIImage imageNamed:@"save_btn"];
        [self.saveBtn setBackgroundImage:saveBtnImage forState:UIControlStateNormal];
        self.saveBtn.frame = CGRectMake(0, 0, saveBtnImage.size.width, saveBtnImage.size.height);
        self.saveBtn.center = CGPointMake( self.frame.size.width - 40, 50);
        
        self.clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *clearBtnImage = [UIImage imageNamed:@"clear_btn"];
        [self.clearBtn setBackgroundImage:clearBtnImage forState:UIControlStateNormal];
        self.clearBtn.frame = CGRectMake(0, 0, clearBtnImage.size.width, clearBtnImage.size.height);
        self.clearBtn.center = CGPointMake( self.frame.size.width - 40, self.saveBtn.frame.size.height + self.saveBtn.frame.origin.y + 30);

        self.sliderColor = [[UISlider alloc] initWithFrame:CGRectMake(self.frame.size.width - 300, self.frame.size.height - 50, 250, 30)];
        self.sliderColor.minimumValue = 0;
        self.sliderColor.maximumValue = 255;
        
       UILabel *lblColor = [[UILabel alloc] initWithFrame:CGRectMake( self.sliderColor.frame.origin.x, self.sliderColor.frame.origin.y + 12, self.sliderColor.frame.size.width, self.sliderColor.frame.size.height)];
        lblColor.text = @"potlood kleur";
        lblColor.textColor = txtColor;
        lblColor.textAlignment = NSTextAlignmentCenter;
        lblColor.font = [UIFont fontWithName:@"Avenir Next" size:12];
        
       
        [self.sliderColor addTarget:self action:@selector(sliderColorMove:) forControlEvents:UIControlEventValueChanged];
        [self.sliderStroke addTarget:self action:@selector(sliderStrokeMove:) forControlEvents:UIControlEventValueChanged];
          
        self.colorPreview = [[UIView alloc] initWithFrame:CGRectMake(self.sliderColor.frame.origin.x + self.sliderColor.frame.size.width + 10, self.sliderColor.frame.origin.y + 7, 16, 16)];
        self.colorPreview.backgroundColor = [UIColor colorWithHue:self.sliderColor.value/255 saturation:.7 brightness:1 alpha:.7];
       
        
        self.canvas = [[CanvasView alloc] initWithFrame:CGRectMake(0,0,self.frame.size.width, self.frame.size.height) color:self.sliderColor.value andSize:self.sliderStroke.value];
        [self addSubview:self.canvas];
        
        
        [self addSubview:self.lblInfo];
        [self addSubview:lblSize];
        [self addSubview:self.sliderStroke];
        [self addSubview:self.saveBtn];
        [self addSubview:self.clearBtn];
        [self addSubview:lblColor];
        [self addSubview:self.sliderColor];
        [self addSubview:self.colorPreview];
       
    }
    return self;
}

- (void)sliderColorMove:(id)sender {
    self.colorPreview.backgroundColor = [UIColor colorWithHue:self.sliderColor.value/255 saturation:.7 brightness:1 alpha:.7];
    self.canvas.brushColor = self.sliderColor.value;
}

- (void)sliderStrokeMove:(id)sender {
    self.canvas.brushSize = self.sliderStroke.value;
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



@end
