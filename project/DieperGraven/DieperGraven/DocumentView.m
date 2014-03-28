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
        
    }
    return self;
}

- (void)createDocumentView {
    
    self.lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0,10, self.frame.size.width, 30)];
    self.lblTitle.text = self.title;
    self.lblTitle.textColor = [UIColor blackColor];
    self.lblTitle.textAlignment = NSTextAlignmentCenter;
    self.lblTitle.font = [UIFont fontWithName:@"Avenir Next" size:24];
    [self addSubview:self.lblTitle];
    
    // TODO: make label height size of text
    self.lblStory = [[UILabel alloc] initWithFrame:CGRectMake(0, self.lblTitle.frame.origin.y + 35, self.frame.size.width, 20)];
    self.lblStory.text = self.story;
    self.lblStory.textColor = [UIColor blackColor];
    self.lblStory.textAlignment = NSTextAlignmentCenter;
    self.lblStory.font = [UIFont fontWithName:@"Avenir Next" size:16];
    [self addSubview:self.lblStory];
    
    if(self.image != nil){
        self.imageFrame = [[UIImageView alloc] initWithImage:self.image];
        // TODO: don't stretch image size
        self.imageFrame.frame = CGRectMake(10,80, self.frame.size.width - 20, self.image.size.height/2);
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
