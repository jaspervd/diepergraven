//
//  TeamFactory.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 25/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "TeamFactory.h"

@implementation TeamFactory


+ (Team *)createTeamName:(NSString *)name Objects:(int)objects andTime:(NSString *)time {
    Team *team = [[Team alloc] init];
    team.name = name;
    team.objects = objects;
    team.time = time;
    return team;
}

+ (Team *)createTeamFromDictionary:(NSDictionary *)dict {
    Team *team = [[Team alloc] init];
    team.name = [dict objectForKey:@"team_name"];
    team.objects = [[dict objectForKey:@"objects"] floatValue];
    team.time = [dict objectForKey:@"time"];
    return team;
}

@end
