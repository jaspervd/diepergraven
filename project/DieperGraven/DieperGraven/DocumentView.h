//
//  DocumentView.h
//  DieperGraven
//
//  Created by Niels Boey on 28/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DocumentView : UIView

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *story;
@property (nonatomic,strong) UIImage *image;

@property (nonatomic,strong) UILabel *lblTitle;
@property (nonatomic,strong) UILabel *lblStory;
@property (nonatomic, strong) UIImageView *imageFrame;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image andStory:(NSString *)story;

@end
