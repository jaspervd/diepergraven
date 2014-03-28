//
//  ArchaeologistView.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArchaeologistView : UIView

@property (strong, nonatomic) UILabel *lblInfo;
@property (nonatomic,strong) UIButton *btnObject;
@property (nonatomic,strong) UIImageView *digField;
@property CGPoint userPoint;

-(void)addObject:(NSDictionary *)dict;

@end
