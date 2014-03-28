//
//  DocumentFactory.m
//  DieperGraven
//
//  Created by Niels Boey on 28/03/14.
//  Copyright (c) 2014 Niels Boey & Jasper Van Damme. All rights reserved.
//

#import "DocumentFactory.h"

@implementation DocumentFactory


+ (Document *)createDocumentPersonFromDictionary:(NSDictionary *)dictionary {
    
    Document *document = [[Document alloc] init];
    document.title = [dictionary objectForKey:@"name"];
    document.story = [dictionary objectForKey:@"story"];
    document.lifespan = [dictionary objectForKey:@"lifespan"];
    document.path = [dictionary objectForKey:@"path"];
    
    return document;
}

@end



