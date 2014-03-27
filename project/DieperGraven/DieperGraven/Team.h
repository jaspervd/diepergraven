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
/*@property (strong, nonatomic) NSString *archaeologist;
@property (strong, nonatomic) NSString *historian;
@property (strong, nonatomic) NSString *geologist;
@property (strong, nonatomic) NSString *draftsman;*/
@property (nonatomic) int objects;
@property (strong, nonatomic) NSString *time;

@end
