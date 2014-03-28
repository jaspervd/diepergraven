//
//  ScreensView.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "ScreensView.h"

@implementation ScreensView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        
        self.leftBarV = [[LeftBarView alloc] initWithFrame:CGRectMake(0, 0, 158, self.frame.size.width)];
        [self addSubview:self.leftBarV];
 
        CGRect screenFrame = CGRectMake(158, 0, (self.frame.size.height - 158), self.frame.size.width);
        self.archaeologistV = [[ArchaeologistView alloc] initWithFrame:screenFrame];
        self.historianV = [[HistorianView alloc] initWithFrame:screenFrame];
        self.geologistV = [[GeologistView alloc] initWithFrame:CGRectMake(79, 0, (self.frame.size.height - 158), self.frame.size.width)];
        self.draftsmanV = [[DraftsmanView alloc] initWithFrame:screenFrame];
        [self addSubview:self.archaeologistV];
        [self addSubview:self.historianV];
        [self addSubview:self.draftsmanV];
        [self addSubview:self.geologistV];
        
        
    }
    return self;
}

- (void)archaeologistTapped:(id)sender {
    NSLog(@"Arch tapped");
    
    [self bringSubviewToFront:self.archaeologistV];
}

- (void)historianTapped:(id)sender {
    NSLog(@"Hist tapped");
    [self bringSubviewToFront:self.historianV];
}

- (void)geologistTapped:(id)sender {
    NSLog(@"Geo tapped");
    [self bringSubviewToFront:self.geologistV];
}

- (void)draftsmanTapped:(id)sender {
    NSLog(@"Draft tapped");
    [self bringSubviewToFront:self.draftsmanV];
}


@end
