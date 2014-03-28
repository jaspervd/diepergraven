//
//  ObjectView.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 28/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ObjectView : UIView

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) UIButton *btnObject;
- (id)initWithFrame:(CGRect)frame andIdentifier:(NSString *)identifier;

@end
