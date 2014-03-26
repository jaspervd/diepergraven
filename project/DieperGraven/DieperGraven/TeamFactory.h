//
//  TeamFactory.h
//  DieperGraven
//
//  Created by Jasper Van Damme on 25/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Team.h"

@interface TeamFactory : NSObject

+ (Team *)createTeamWithName:(NSString *)name Archaeologist:(NSString *)archaeologist Historian:(NSString *)historian Geologist:(NSString *)geologist Draftsman:(NSString *)draftsman Objects:(int)objects andTime:(NSString *)time;

+ (Team *)createTeamFromDictionary:(NSDictionary *)dict;

@end
