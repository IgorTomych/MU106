//
//  Route.h
//  MU106
//
//  Created by Alex Lifantyev on 30.10.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Route : NSManagedObject

@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *routeDescription;
@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *ownerId;
@property (nonatomic) BOOL isStarred;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
