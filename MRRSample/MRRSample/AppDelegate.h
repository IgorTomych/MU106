//
//  AppDelegate.h
//  MRRSample
//
//  Created by Igor Tomych on 10/28/13.
//  Copyright (c) 2013 itomych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Test.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (assign, nonatomic) Test* testObject;
@property (strong, nonatomic) UIWindow *window;

@end
