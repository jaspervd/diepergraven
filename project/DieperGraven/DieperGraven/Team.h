//
//  Team.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 25/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Team : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) int objects;
@property (strong, nonatomic) NSString *time;

@end
