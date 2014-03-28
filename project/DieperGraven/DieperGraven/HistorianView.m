//
//  HistorianView.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "HistorianView.h"

@implementation HistorianView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"historicus_bg"]];
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        scrollView.canCancelContentTouches = NO;
        scrollView.delaysContentTouches = NO;
        [self addSubview:scrollView];
        
        
        UIColor *txtColor = [UIColor colorWithRed:0/255.0f green: 0/255.0f blue:0/255.0f alpha:.4];
        
        self.lblInfo = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width / 2) - 150, self.frame.size.height - 50, 300, 30)];
        self.lblInfo.text = @"Bekijk de gevonden documenten";
        self.lblInfo.textColor = txtColor;
        self.lblInfo.textAlignment = NSTextAlignmentCenter;
        self.lblInfo.font = [UIFont fontWithName:@"Avenir Next" size:18];
        [self addSubview:self.lblInfo];
        
        
        NSArray *imagesDicts = @[ @{@"image_name": @"image 1", @"path": @"01"}, @{@"image_name": @"image 2", @"path": @"02"}, @{@"image_name": @"image 3", @"path": @"03"}, @{@"image_name": @"image 4", @"path": @"04"}, @{@"image_name": @"image 5", @"path": @"05"}];
        
        CGFloat padding = 50.0f;
        CGFloat yPos = 50.0f;
        
        for (NSDictionary *dictionary in imagesDicts) {
            
            UIImage *image = [UIImage imageNamed:[dictionary objectForKey:@"path"]];
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width / 2) - ((self.frame.size.width - 200) / 2), yPos, self.frame.size.width - 200, self.frame.size.height - 120)];
            imageView.image = image;
            
            [scrollView addSubview:imageView];
            
            yPos = CGRectGetMaxY(imageView.frame) + padding;
        }
        
        scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width, yPos);
    
    }
    return self;
}


@end
