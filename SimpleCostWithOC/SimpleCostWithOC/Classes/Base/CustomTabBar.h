//
//  CustomTabBar.h
//  SimpleCostWithOC
//
//  Created by joe on 2016/12/13.
//  Copyright © 2016年 joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomTabBar;
@protocol CustomTabBarDelegate <NSObject>
@optional
/** 点击加号按钮调用 */
- (void)tabBarDidSelectedPlusButton:(CustomTabBar *)tabBar;

- (void)tabBar:(CustomTabBar *)tabBar didSelectedButton:(NSInteger)index;

@end

@interface CustomTabBar : UIView

@property (nonatomic, strong) NSMutableArray *itemArray;
@property (nonatomic, weak) id<CustomTabBarDelegate> delegate;

@end
