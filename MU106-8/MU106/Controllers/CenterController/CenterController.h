//
//  CenterController.h
//  MU106
//
//  Created by Alex Lifantyev on 04.11.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MBProgressHUD.h"
#import "Model.h"
#import "Route.h"


@interface CenterController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) Route* selectedRoute;
@property (strong, nonatomic) NSMutableArray *polylines;

- (IBAction)addToFavorites:(id)sender;

@end
