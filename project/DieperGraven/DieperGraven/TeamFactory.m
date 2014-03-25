//
//  TeamFactory.m
//  DieperGraven
//
//  Created by Jasper Van Damme on 25/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "TeamFactory.h"

@implementation TeamFactory

+ (Team *)createTeamWithName:(NSString *)name Archaeologist:(NSString *)archaeologist Historian:(NSString *)historian Geologist:(NSString *)geologist Draftsman:(NSString *)draftsman Objects:(int)objects andTime:(NSString *)time {
    Team *team = [[Team alloc] init];
    team.name = name;
    team.archaeologist = archaeologist;
    team.historian = historian;
    team.geologist = geologist;
    team.draftsman = draftsman;
    team.objects = objects;
    team.time = time;
    return team;
}

@end
