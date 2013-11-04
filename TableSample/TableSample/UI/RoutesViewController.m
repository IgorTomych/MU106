//
//  RoutesViewController.m
//  TableSample
//
//  Created by Igor Tomych on 10/28/13.
//  Copyright (c) 2013 itomych. All rights reserved.
//

#import "RoutesViewController.h"
#import "MyCell.h"
#import "ImageCell.h"

//
//@interface NSString (StringAdditionFunctionality)
//- (void)mySuperDupper;
//@end



@interface RoutesViewController ()

@property (nonatomic, strong) NSString* myHiddenString;

-(void)methodWithArgument1:(NSString*)test1;

-(ImageCell *)configureImageCell:(NSIndexPath * )indexPath forTable:(UITableView *)tableView;
-(MyCell *)configureLabelCell:(NSIndexPath * )indexPath forTable:(UITableView *)tableView;

@end

@implementation RoutesViewController

NSString* string;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self configureLabelCell:indexPath forTable:tableView];
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return 51.f;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
}


#pragma mark - Internal Logic



-(MyCell *)configureLabelCell:(NSIndexPath * )indexPath forTable:(UITableView *)tableView {
    
    static NSString *CellIdentifier = @"LabelCell";
    
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.testLabel.text = [NSString stringWithFormat:@"%d", indexPath.row + 10];
    
    
    return cell;
}


-(void)methodWithArgument1:(NSString *)test1 {
    
}
@end
