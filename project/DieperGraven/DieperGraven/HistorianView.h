//
//  HistorianView.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DocumentView.h"
#import "Document.h"
#import "DocumentFactory.h"

#import "PhotoView.h"
#import "Photo.h"
#import "PhotoFactory.h"

@interface HistorianView : UIView

@property (strong, nonatomic) UILabel *lblInfo;

@property (nonatomic,strong) UILabel *lblName;
@property (nonatomic, strong) UILabel *lblLife;
@property (nonatomic,strong) UILabel *lblStory;

@property (nonatomic,strong) DocumentView *documentV;
@property (nonatomic,strong) PhotoView *photoV;

@end
