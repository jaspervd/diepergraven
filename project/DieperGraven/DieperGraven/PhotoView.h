//
//  PhotoView.h
//  DieperGraven
//
//  Created by Niels Boey on 28/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoView : UIView

@property (nonatomic,strong) NSString *description;
@property (nonatomic,strong) UIImage *image;

@property (nonatomic,strong) UILabel *lblTitle;
@property (nonatomic, strong) UIImageView *imageFrame;

- (id)initWithFrame:(CGRect)frame description:description andImage:image;

@end
