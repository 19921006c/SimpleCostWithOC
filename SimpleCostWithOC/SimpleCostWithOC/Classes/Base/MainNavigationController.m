//
//  MainNavigationController.m
//  SimpleCostWithOC
//
//  Created by joe on 2016/12/8.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "MainNavigationController.h"
#import "CustomTabBar.h"
@interface MainNavigationController ()<UINavigationControllerDelegate>
@end

@implementation MainNavigationController
#pragma mark - life cycle
+ (void)initialize
{
    [self setupNavTheme];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
}

#pragma mark - delegate
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count) {//不是根控制器
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    
    [super pushViewController:viewController animated:animated];
}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UITabBarController *tabBarVc = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    // 删除系统自带的tabBarButton
    for (UIView *tabBarButton in tabBarVc.tabBar.subviews) {
        if (![tabBarButton isKindOfClass:[CustomTabBar class]]) {
            [tabBarButton removeFromSuperview];
        }
    }
    
}
#pragma mark - event response
#pragma mark - private methods
+ (void)setupNavTheme
{
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.translucent = YES;
    
    UIImage *image = [UIImage imageWithClearColor];
    [navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    navigationBar.clipsToBounds = YES;
    
    //去除导航栏边界的黑线
    navigationBar.shadowImage = [[UIImage alloc]init];
    // 1.3.设置文字颜色
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    md[UITextAttributeTextColor] = [UIColor whiteColor];
    // 取出阴影  UIOffset
    md[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    // 设置字体大小
    md[UITextAttributeFont] = [UIFont systemFontOfSize:20];
    md[UITextAttributeFont] = [UIFont systemFontOfSize:20];
    [navigationBar setTitleTextAttributes:md];
    
    navigationBar.tintColor = [UIColor whiteColor];
}
#pragma mark - getters and setters
@end
