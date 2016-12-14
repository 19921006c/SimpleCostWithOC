//
//  MainTabBarController.m
//  SimpleCostWithOC
//
//  Created by joe on 2016/12/8.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"
#import "DetailsViewController.h"
#import "MoreViewController.h"
#import "CustomTabBar.h"
#import "AddRecordViewController.h"
@interface MainTabBarController ()<CustomTabBarDelegate>

@property (nonatomic, strong) DetailsViewController *detailsVc;
@property (nonatomic, strong) MoreViewController *moreVc;
@property (nonatomic, strong) NSMutableArray *itemArray;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation MainTabBarController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 添加所有子控制器 */
    [self addAllChildController];
    /** 自定义tabbar */
    [self setUpTabBar];
    
    UIImageView *imageView = [BackgroundImageView sharedInstance];
    [self.view insertSubview:imageView atIndex:0];
    self.imageView = imageView;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.imageView.frame = self.view.bounds;
}

#pragma mark - delegate
//CustomTabBarDelegate
-(void)tabBarDidSelectedPlusButton:(CustomTabBar *)tabBar
{
    AddRecordViewController *vc = [[AddRecordViewController alloc] init];
    
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)tabBar:(CustomTabBar *)tabBar didSelectedButton:(NSInteger)index
{
    if (index == 0 && self.selectedIndex == index) { // 点击首页，刷新
//        [_detailsVc refresh];
    }
    
    self.selectedIndex = index;
}
#pragma mark - event response
#pragma mark - private methods
/** 自定义tabbar */
- (void)setUpTabBar
{
    CustomTabBar *tabBar = [[CustomTabBar alloc] initWithFrame:self.tabBar.frame];
    tabBar.backgroundColor = [UIColor clearColor];
    
    //设置代理
    tabBar.delegate = self;
    //
    tabBar.itemArray = self.itemArray;
    
    [self.view addSubview:tabBar];
    
    [self.tabBar removeFromSuperview];
    
}
/** 添加所有子控制器 */
- (void)addAllChildController
{
    /** 添加明细页控制器 */
    [self addOneChildController:self.detailsVc title:@"明细" norImageName:@"mingxi_close" selectedImageName:@"mingxi_open"];
    /** 添加更多页控制器 */
    [self addOneChildController:self.moreVc title:@"更多" norImageName:@"gengduo_close" selectedImageName:@"gengduo_open"];
}
- (void)addOneChildController:(UIViewController *)controller title:(NSString *)title norImageName:(NSString *)norImageName selectedImageName:(NSString *)selectedImageName
{
    //设置tabbar图片不被渲染
    self.tabBar.tintColor = kTabBarBackgroundColor;
    //设置tabBar背景颜色不被改变
//    self.tabBar.backgroundColor = [UIColor clearColor];
    controller.tabBarItem.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:norImageName];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    
    [self.itemArray addObject:controller.tabBarItem];
    MainNavigationController  *nav = [[MainNavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:nav];
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
- (NSMutableArray *)itemArray
{
    if (_itemArray == nil) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}



@end
