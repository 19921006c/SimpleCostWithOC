//
//  DetailsViewController.m
//  SimpleCostWithOC
//
//  Created by joe on 2016/12/13.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "DetailsViewController.h"
#import "AddRecordViewController.h"
@interface DetailsViewController ()

@end

@implementation DetailsViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 设置 */
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(leftDown)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightDown)];
    self.navigationItem.title = @"明细";
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
}
#pragma mark - delegate
#pragma mark - event response
#pragma mark - private methods
- (void)leftDown
{
    AddRecordViewController *vc = [[AddRecordViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)rightDown
{
    
}
#pragma mark - getters and setters

@end
