//
//  ApiRouteClient.m
//  MU106
//
//  Created by Alex Lifantyev on 06.11.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import "ApiRouteClient.h"
#import "AFNetworking.h"

#define kApiBaseUrl @"http://itomy.ch/"

@implementation ApiRouteClient

+ (id)sharedInstance
{
    static ApiRouteClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[ApiRouteClient alloc] initWithBaseURL:[NSURL URLWithString:kApiBaseUrl]];
    });
    
    return __sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        //[self setDefaultHeader:@"x-api-token" value:APIToken];
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    } else {
        self = nil;
    }
    
    return self;
}

- (void)updateRoutesList:(void (^)(NSArray *routes))successBlock failure:(void (^)(NSError *error))failureBlock;
{
    //NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //[parameters setObject:@"json" forKey:@"format"];
    
    [self getPath:@"routes.php"
       parameters:nil
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              successBlock((NSArray *)responseObject);
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              failureBlock(error);
          }
     ];

}

@end