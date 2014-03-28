//
//  HistorianView.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 26/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "HistorianView.h"

@implementation HistorianView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"historicus_bg"]];
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        scrollView.canCancelContentTouches = NO;
        scrollView.delaysContentTouches = NO;
        [self addSubview:scrollView];
        
        
        UIColor *txtColor = [UIColor colorWithRed:0/255.0f green: 0/255.0f blue:0/255.0f alpha:.4];
        
        self.lblInfo = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width / 2) - 150, self.frame.size.height - 50, 300, 30)];
        self.lblInfo.text = @"Bekijk de gevonden documenten";
        self.lblInfo.textColor = txtColor;
        self.lblInfo.textAlignment = NSTextAlignmentCenter;
        self.lblInfo.font = [UIFont fontWithName:@"Avenir Next" size:18];
        [self addSubview:self.lblInfo];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"people" ofType:@"json"];
        NSError *error = nil;
        NSDictionary *peopleJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingMutableContainers error:&error];
        
        CGFloat padding = 50.0f;
        CGFloat yPos = 50.0f;
        
        
        for (NSDictionary *dictionary in peopleJson) {
            
            Document *document = [DocumentFactory createDocumentPersonFromDictionary:dictionary];
  
            UIImage *image = [UIImage imageNamed: document.path];
            NSString *title = [NSString stringWithFormat:@"%@", document.title];
            NSString *story = [NSString stringWithFormat:@"%@", document.story];
            NSString *lifespan = [NSString stringWithFormat:@"%@", document.lifespan];

  
            CGRect viewFrame = CGRectMake((self.frame.size.width / 2) - ((self.frame.size.width - 200) / 2), yPos, self.frame.size.width - 200, self.frame.size.height - 120);
            
            self.view = [[DocumentView alloc] initWithFrame:viewFrame title:title image:image lifespan:lifespan andStory:story];
            [scrollView addSubview:self.view];
            
            yPos = CGRectGetMaxY(self.view.frame) + padding;
        }
        
        path = [[NSBundle mainBundle] pathForResource:@"images" ofType:@"json"];
        error = nil;
        NSDictionary *imagesJson = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingMutableContainers error:&error];
        
        
        
        NSLog(@"JSON ALLES, TEST TEST TEST: %@",imagesJson);
        
        for (NSDictionary *dictionary in imagesJson){
            Document *document = [DocumentFactory createDocumentPersonFromDictionary:dictionary];
            
            UIImage *image = [UIImage imageNamed: document.path];
            NSString *title = [NSString stringWithFormat:@"%@", document.title];
            NSString *story = [NSString stringWithFormat:@"%@", document.story];
            NSString *lifespan = [NSString stringWithFormat:@"%@", document.lifespan];
            
            
            CGRect viewFrame = CGRectMake((self.frame.size.width / 2) - ((self.frame.size.width - 200) / 2), yPos, self.frame.size.width - 200, self.frame.size.height - 120);
            
            self.view = [[DocumentView alloc] initWithFrame:viewFrame title:title image:image lifespan:lifespan andStory:story];
            [scrollView addSubview:self.view];
            
            yPos = CGRectGetMaxY(self.view.frame) + padding;

        }
        
        scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width, yPos);
    
    }
    return self;
}


@end
