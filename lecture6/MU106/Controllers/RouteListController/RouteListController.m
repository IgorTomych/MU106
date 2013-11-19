//
//  RouteListController.m
//  MU106
//
//  Created by Alex Lifantyev on 29.10.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import "RouteListController.h"
#import "UI.h"
#import "AppDelegate.h"

@interface RouteListController ()

    @property (strong, nonatomic) NSMutableArray *modelRoutes;
    @property (strong, nonatomic) NSMutableArray *modelFavoriteRoutes;
    
@end

@implementation RouteListController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        //
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ApiRouteClient *sharedRouteClient = [ApiRouteClient sharedInstance];
    
    sharedRouteClient.delegate = self;
    [sharedRouteClient updateRoutesList:^(NSArray *routes) {
        NSEnumerator *enumerator = [routes objectEnumerator];
        
        NSManagedObjectContext* context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedContext;
        id obj;
        
        while ((obj = [enumerator nextObject]))
        {
            

            Route *route = [NSEntityDescription insertNewObjectForEntityForName:@"Route" inManagedObjectContext:context]; //[[Route alloc] initWithDictionary:(NSDictionary *)obj];
            [self.modelRoutes addObject:route];
        }
        
        [self.tableView reloadData];

    }
    failure:^(NSError *error) {
         NSLog(@"%@", error);
    }];
    
    [self.navigationItem setTitle:NSLocalizedString(@"ALL ROUTES", nil)];
    
    self.modelRoutes = [[NSMutableArray alloc] init];
    self.modelFavoriteRoutes = [[NSMutableArray alloc] init];

    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
#pragma mark - Table view data source
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1; //We have to groups: Starred and not starred
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows;
    //if (section == 0) {
    //    rows = self.modelFavoriteRoutes.count;
    //} else {
        rows = self.modelRoutes.count;
    //}
    return rows;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RouteListCell";
    RouteListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Route *obj = [self.modelRoutes objectAtIndex:indexPath.row];
    UIImage *imgStar;
    if (obj.isStarred) {
        imgStar = [UIImage imageNamed:@"star_active"];
        cell.tag = 1;
    } else {
        imgStar = [UIImage imageNamed:@"star_inactive"];
        cell.tag = 0;
    }
    
    cell.lblRoute.text = obj.title;
    cell.lblPrice.text = [NSString stringWithFormat:@"%@ %@", obj.price, NSLocalizedString(@"SHORT CURRENCY", nil)];
    cell.lblDescription.text = obj.description;
    [cell.imgStarred setImage:imgStar];
    
    return cell;
}
    
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *header;
    if (section == 0) {
        header = NSLocalizedString(@"FAVORITES", nil);
    } else {
        header = NSLocalizedString(@"ROUTES", nil);
    }
    return header;
}

#pragma mark - Table view delegate
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RouteListCell *cell = (RouteListCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (cell.tag == 1) {
        //NSLog(@"HIGHLITED !!!");
    } else {
        //NSLog(@" NOT HIGHLITED !!!");
    }
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Height of cell in Storyboard
    return 53.f;
}

#pragma mark - ApiRouteClient delegate

- (void)ApiRouteClient:(ApiRouteClient *)client didUpdateRoutes:(NSArray *)routes
{
    NSEnumerator *enumerator = [routes objectEnumerator];
    id obj;
    while ((obj = [enumerator nextObject]))
    {
        Route *route = [[Route alloc] initWithDictionary:(NSDictionary *)obj];
        [self.modelRoutes addObject:route];
    }
    
    [self.tableView reloadData];
}

- (void)ApiRouteClient:(ApiRouteClient *)client didFailWithError:(NSError *)error
{
    NSLog(@"Error API %@", error.description);
}

@end
