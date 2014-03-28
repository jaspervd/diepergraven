//
//  PhotoView.m
//  DieperGraven
//
//  Created by Niels Boey on 28/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "PhotoView.h"

@implementation PhotoView

- (id)initWithFrame:(CGRect)frame description:description andImage:image
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:.6];
        
        self.description = description;
        self.image = image;
        
        [self createPhotoView];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.lblTitle.frame.size.height + self.lblTitle.frame.origin.y + 40 );
        
    }
    return self;
}

- (void)createPhotoView {
    
    self.imageFrame = [[UIImageView alloc] initWithImage:self.image];
    self.imageFrame.frame = CGRectMake(20, self.lblTitle.frame.origin.y + 40, self.frame.size.width - 40, 400);
    self.imageFrame.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.imageFrame];
    
    self.lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(40, self.imageFrame.frame.origin.y + self.imageFrame.frame.size.height + 10, self.frame.size.width - 80, 20)];
    self.lblTitle.text = self.description;
    self.lblTitle.textColor = [UIColor blackColor];
    self.lblTitle.textAlignment = NSTextAlignmentCenter;
    self.lblTitle.font = [UIFont fontWithName:@"Avenir Next" size:16];
    self.lblTitle.numberOfLines = 0;

    CGRect frame = self.lblTitle.frame;
    [self.lblTitle sizeToFit];
    frame.size.height = self.lblTitle.frame.size.height;
    self.lblTitle.frame = frame;

    [self addSubview:self.lblTitle];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
