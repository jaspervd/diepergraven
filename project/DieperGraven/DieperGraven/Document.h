//
//  Document.h
//  DieperGraven
//
//  Created by Niels Boey on 28/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Document : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *story;
@property (nonatomic,strong) NSString *lifespan;
@property (nonatomic,strong) NSString *path;

@end