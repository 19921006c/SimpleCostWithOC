//
//  MainTabBarController.m
//  SimpleCostWithOC
//
//  Created by joe on 2016/12/8.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "MainNavigationController.h"
@interface MainTabBarController ()

@property (nonatomic, strong)HomeViewController *homeVc;

@end

@implementation MainTabBarController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addOneChildController:self.homeVc title:@"首页" norImageName:@"mingxi_close" selectedImageName:@"mingxi_open"];
}
#pragma mark - delegate
#pragma mark - event response
#pragma mark - private methods
- (void)addOneChildController:(UIViewController *)controller title:(NSString *)title norImageName:(NSString *)norImageName selectedImageName:(NSString *)selectedImageName
{
    //设置tabbar图片不被渲染
    self.tabBar.tintColor = [UIColor colorWithHexString:@"0dc3de"];
    //设置tabBar背景颜色不被改变
    self.tabBar.backgroundColor = [UIColor whiteColor];
    controller.tabBarItem.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:norImageName];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    MainNavigationController  *nav = [[MainNavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:nav];
}
#pragma mark - getters and setters
- (HomeViewController *)homeVc
{
    if (_homeVc == nil) {
        _homeVc = [[HomeViewController alloc] init];
    }
    return _homeVc;
}




@end
