//
//  AppDelegate.m
//  Lecture2
//
//  Created by Igor Tomych on 10/24/13.
//  Copyright (c) 2013 itomych. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate 

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"didFinishLaunchingWithOptions");
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    RootViewController* controller = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
    
    controller.rootDelegate = self;
    
    self.window.rootViewController = controller;
    

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"applicationDidEnterBackground");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"applicationWillEnterForeground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"applicationDidBecomeActive");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"applicationWillTerminate");
}

#pragma mark - RootViewControllerDelegate 

-(void)didButtonClick {
    NSLog(@"AppDelegate did something on button click!");
}

@end
