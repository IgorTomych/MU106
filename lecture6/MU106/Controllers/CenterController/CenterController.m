//
//  CenterController.m
//  MU106
//
//  Created by Alex Lifantyev on 04.11.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import "CenterController.h"

@interface CenterController ()

@end

@implementation CenterController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView* myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];

    [self.view addSubview:myImageView];
    dispatch_queue_t myQueue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(myQueue, ^{
        
        NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://images.apple.com/mac/home/images/productbrowser/imac.jpg"]];
        
        UIImage* image = [[UIImage alloc] initWithData:data];

        dispatch_async(dispatch_get_main_queue(), ^{
            myImageView.image = image;
        });
    });
    
    
    //dispatch_release(myQueue);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)viewFavorites:(id)sender {
}
@end
