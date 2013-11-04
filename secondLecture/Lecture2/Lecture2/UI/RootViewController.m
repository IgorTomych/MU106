//
//  RootViewController.m
//  Lecture2
//
//  Created by Igor Tomych on 10/24/13.
//  Copyright (c) 2013 itomych. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.lblTitle.text = @"Hello World!";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickedAction:(id)sender {
    if ([self.rootDelegate respondsToSelector:@selector(didButtonClick)]) {
        [self.rootDelegate didButtonClick];
    }
}

@end
