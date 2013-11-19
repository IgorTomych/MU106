//
//  RouteListController.h
//  MU106
//
//  Created by Alex Lifantyev on 29.10.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Api.h"
#import "Classes.h"
#import <CoreData/CoreData.h>

@interface RouteListController : UITableViewController <ApiRouteClientDelegate>
    
    @property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
