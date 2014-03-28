//
//  PhotoFactory.h
//  DieperGraven
//
//  Created by Niels Boey on 28/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photo.h"

@interface PhotoFactory : NSObject

+ (Photo *)createPhotoFromDictionary:(NSDictionary *)dictionary;

@end
