//
//  ArchaeologistView.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectView.h"

@interface ArchaeologistView : UIView

@property (strong, nonatomic) UILabel *lblInfo;
@property (nonatomic,strong) ObjectView *objectV;
@property (nonatomic,strong) UIImageView *digField;
@property CGPoint userPoint;
@property (nonatomic, strong) NSMutableArray *arrObjectsToShow;

-(void)addObject:(NSString *)identifier;
-(void)removeObject:(ObjectView *)object;

@end
