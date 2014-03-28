//
//  DocumentView.m
//  DieperGraven
//
//  Created by Niels Boey on 28/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "DocumentView.h"

@implementation DocumentView

- (id)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image andStory:(NSString *)story
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:.6];
        
        self.title = title;
        self.image = image;
        self.story = story;
        
        [self createDocumentView];
        
        if(self.imageFrame == nil){
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.lblStory.frame.size.height + self.lblStory.frame.origin.y + 40 );
        }else {
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.imageFrame.frame.size.height + self.imageFrame.frame.origin.y + 40 );
        }

    }
    return self;
}

- (void)createDocumentView {
    
    self.lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0,40, self.frame.size.width, 30)];
    self.lblTitle.text = self.title;
    self.lblTitle.textColor = [UIColor blackColor];
    self.lblTitle.textAlignment = NSTextAlignmentCenter;
    self.lblTitle.font = [UIFont fontWithName:@"Avenir Next" size:24];
    [self addSubview:self.lblTitle];
    
    // TODO: make label height size of text
  //  CGRect labelFrame = CGRectMake(0, self.lblTitle.frame.origin.y + 35, self.frame.size.width, 20);
    
    self.lblStory = [[UILabel alloc] initWithFrame:CGRectMake(20, self.lblTitle.frame.origin.y + 40, self.frame.size.width - 40, 20)];
    self.lblStory.text = self.story;
    self.lblStory.textColor = [UIColor blackColor];
    self.lblStory.textAlignment = NSTextAlignmentCenter;
    self.lblStory.font = [UIFont fontWithName:@"Avenir Next" size:16];
    self.lblStory.numberOfLines = 0;
    
    CGRect frame = self.lblStory.frame;
    [self.lblStory sizeToFit];
    frame.size.height = self.lblStory.frame.size.height;
    self.lblStory.frame = frame;
    
    /*labelFrame.size.width = self.frame.size.width;
    self.lblStory.frame = labelFrame;*/
    [self addSubview:self.lblStory];
    
    if(self.image != nil){
        self.imageFrame = [[UIImageView alloc] initWithImage:self.image];
        self.imageFrame.frame = CGRectMake(20, self.lblStory.frame.origin.y + self.lblStory.frame.size.height + 20, self.frame.size.width - 40, 400);
        self.imageFrame.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.imageFrame];
    }
    
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
