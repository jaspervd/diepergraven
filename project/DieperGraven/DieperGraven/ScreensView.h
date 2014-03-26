//
//  ScreensView.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftBarView.h"
#import "ArchaeologistView.h"
#import "HistorianView.h"
#import "GeologistView.h"
#import "DraftsmanView.h"

@interface ScreensView : UIView
@property (nonatomic, strong) LeftBarView *leftBarV;
@property (nonatomic, strong) ArchaeologistView *archaeologistV;
@property (nonatomic, strong) HistorianView *historianV;
@property (nonatomic, strong) GeologistView *geologistV;
@property (nonatomic, strong) DraftsmanView *draftsmanV;

- (void)archaeologistTapped:(id)sender;
- (void)historianTapped:(id)sender;
- (void)geologistTapped:(id)sender;
- (void)draftsmanTapped:(id)sender;

@end
