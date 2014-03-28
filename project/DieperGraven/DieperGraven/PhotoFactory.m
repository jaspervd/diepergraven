//
//  PhotoFactory.m
//  DieperGraven
//
//  Created by Niels Boey on 28/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "PhotoFactory.h"

@implementation PhotoFactory

+ (Photo *)createPhotoFromDictionary:(NSDictionary *)dictionary {
    
    Photo *photo = [[Photo alloc] init];
    photo.description = [dictionary objectForKey:@"description"];
    photo.path = [dictionary objectForKey:@"path"];
    
    return photo;
}

@end
