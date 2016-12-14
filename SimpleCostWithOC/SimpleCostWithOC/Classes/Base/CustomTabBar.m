//
//  CustomTabBar.m
//  SimpleCostWithOC
//
//  Created by joe on 2016/12/13.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "CustomTabBar.h"
#import "CustomTabBarButton.h"
@interface CustomTabBar()
@property (nonatomic, weak) UIButton *plusButton;
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, weak) UIButton *selectedButton;
@end

@implementation CustomTabBar

#pragma mark - life cycle
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.width;
    CGFloat h = self.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = w / (self.itemArray.count + 1);
    CGFloat btnH = self.bounds.size.height;
    
    NSInteger i = 0;
    // 设置tabBarButton的frame
    for (UIView *tabBarButton in self.buttons) {
        if (i == self.buttons.count - 1) {
            i = self.buttons.count;
        }
        btnX = i * btnW;
        tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
        i++;
    }
    // 设置添加按钮的位置
    CGFloat plusBtnWidth = kTabBarHeight - 5;
    self.plusButton.size = CGSizeMake(plusBtnWidth, plusBtnWidth);
    self.plusButton.center = CGPointMake(w * 0.5, h * 0.5);
}
#pragma mark - delegate
#pragma mark - event response
- (void)btnAction:(UIButton *)button
{
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
    
    /** tabBarVc切换到对应的控制器 */
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButton:)]) {
        [self.delegate tabBar:self didSelectedButton:button.tag];
    }
}
- (void)plusBtnAction
{
    if ([self.delegate respondsToSelector:@selector(tabBarDidSelectedPlusButton:)]) {
        [self.delegate tabBarDidSelectedPlusButton:self];
    }
}

#pragma mark - private methods
#pragma mark - getters and setters
- (NSMutableArray *)buttons
{
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (void)setItemArray:(NSMutableArray *)itemArray
{
    _itemArray = itemArray;
    for (UITabBarItem *item in itemArray) {
        CustomTabBarButton *btn = [CustomTabBarButton buttonWithType:UIButtonTypeCustom];
        btn.item = item;
        btn.tag = self.buttons.count;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        if (btn.tag == 0) {//选中第0个
            [self btnAction:btn];
        }
        [self addSubview:btn];
        [self.buttons addObject:btn];
    }
}
- (UIButton *)plusButton
{
    if (_plusButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"jiyibi"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"jiyibi"] forState:UIControlStateHighlighted];

        // 监听按钮的点击
        [btn addTarget:self action:@selector(plusBtnAction) forControlEvents:UIControlEventTouchUpInside];
        _plusButton = btn;
        [self addSubview:_plusButton];
    }
    return _plusButton;
}
@end
