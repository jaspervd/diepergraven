//
//  LeftBarView.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftBarView : UIView

@property (strong, nonatomic) UIButton *btnArchaeologist;
@property (strong, nonatomic) UIButton *btnHistorian;
@property (strong, nonatomic) UIButton *btnGeologist;
@property (strong, nonatomic) UIButton *btnDraftsman;
@property (strong, nonatomic) UIButton *btnStop;

@property (strong, nonatomic) UILabel *lblTime;
@property (strong, nonatomic) UILabel *lblObjects;
//@property (strong, nonatomic) UILabel *lblDocumentCount;
//@property (strong, nonatomic) NSString *documentCountTxt;
//@property int documentCount;

@property (strong, nonatomic) NSDate *startDate;

@property int objects;

//- (void)updateDocumentCount:(int)documentCount;

@end