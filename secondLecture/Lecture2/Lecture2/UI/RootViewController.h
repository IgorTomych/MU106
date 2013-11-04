//
//  RootViewController.h
//  Lecture2
//
//  Created by Igor Tomych on 10/24/13.
//  Copyright (c) 2013 itomych. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol RootViewControllerDelegate <NSObject>
-(void)didButtonClick;
@end

@interface RootViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property (weak, nonatomic) id<RootViewControllerDelegate> rootDelegate;

@end
