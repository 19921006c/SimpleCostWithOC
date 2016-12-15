//
//  MainTabBarController.m
//  ProjectGenericFramework
//
//  Created by joe on 2016/12/14.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"
#import "MainTabBarControllerTabBar.h"
#import "DetailsViewController.h"
#import "MoreViewController.h"
#import "AddRecordViewController.h"

@interface MainTabBarController () <MainTabBarControllerTabBarDelegate>
@property (nonatomic, strong) DetailsViewController *detailsVc;
@property (nonatomic, strong) MoreViewController *moreVc;
@end

@implementation MainTabBarController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    [self addChildVc:self.detailsVc title:@"明细" image:@"mingxi_close" selectedImage:@"mingxi_open"];
    [self addChildVc:self.moreVc title:@"更多" image:@"gengduo_close" selectedImage:@"gengduo_open"];
    
    MainTabBarControllerTabBar *tabBar = [[MainTabBarControllerTabBar alloc] init];
    tabBar.customDelegate = self;
    /** KVC */
    [self setValue:tabBar forKey:@"tabBar"];
    
    [self.tabBar setBackgroundImage:[UIImage imageWithClearColor]];
    self.tabBar.clipsToBounds = YES;
}

#pragma mark - delegate
// MainTabBarControllerTabBarDelegate 加号按钮代理
- (void)tabBarDidClickPlusButton:(MainTabBarControllerTabBar *)tabBar
{
    AddRecordViewController *vc = [[AddRecordViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
#pragma mark - event response
#pragma mark - private methods
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    /** 设置tabbar title  和 navigationbar title */
    childVc.title = title;
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"60C2EB"]} forState:UIControlStateSelected];
    /** 设置图片 */
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    /** 添加子控制器 */
    MainNavigationController *navigationVc = [[MainNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:navigationVc];
}
#pragma mark - getters and setters
- (DetailsViewController *)detailsVc
{
    if (_detailsVc == nil) {
        _detailsVc = [[DetailsViewController alloc] init];
    }
    return _detailsVc;
}
- (MoreViewController *)moreVc
{
    if (_moreVc == nil) {
        _moreVc = [[MoreViewController alloc] init];
    }
    return _moreVc;
}
@end
