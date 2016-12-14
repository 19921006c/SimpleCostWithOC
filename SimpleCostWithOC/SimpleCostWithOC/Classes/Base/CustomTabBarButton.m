//
//  CustomTabBarButton.m
//  SimpleCostWithOC
//
//  Created by joe on 2016/12/13.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "CustomTabBarButton.h"
#import "CustomTabBarBadgeView.h"
#define kBadgeViewRidio 0.7

@interface CustomTabBarButton ()
@property (nonatomic, weak) CustomTabBarBadgeView *badgeView;
@end

@implementation CustomTabBarButton

#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 设置字体颜色
        [self setTitleColor:kTabBarTitleColor forState:UIControlStateNormal];
        [self setTitleColor:kTabBarBackgroundColor forState:UIControlStateSelected];
        
        // 图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        // 文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 设置文字字体
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return self;
}
// 修改按钮内部子控件的frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.imageView
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * kBadgeViewRidio;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    
    // 2.title
    CGFloat titleX = 0;
    CGFloat titleY = imageH - 3;
    CGFloat titleW = self.bounds.size.width;
    CGFloat titleH = self.bounds.size.height - titleY;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    // 3.badgeView
    CGFloat badgeViewX = self.width - self.badgeView.width - 10;
    CGFloat badgeViewY = 0;
    CGFloat badgeViewWidth = self.badgeView.width;
    CGFloat badgeViewHeight = self.badgeView.height;
    self.badgeView.frame = CGRectMake(badgeViewX, badgeViewY, badgeViewWidth, badgeViewHeight);
}
// 重写setHighlighted，取消高亮做的事情
- (void)setHighlighted:(BOOL)highlighted{}
#pragma mark - delegate
#pragma mark - event response
#pragma mark - private methods
// 只要监听的属性一有新值，就会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    [self setTitle:_item.title forState:UIControlStateNormal];
    
    [self setImage:_item.image forState:UIControlStateNormal];
    
    [self setImage:_item.selectedImage forState:UIControlStateSelected];
    
    // 设置badgeValue
    self.badgeView.badgeValue = _item.badgeValue;
}
#pragma mark - getters and setters

// 懒加载badgeView
- (CustomTabBarBadgeView *)badgeView
{
    if (_badgeView == nil) {
        CustomTabBarBadgeView *btn = [CustomTabBarBadgeView buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        _badgeView = btn;
    }
    return _badgeView;
}

// 传递UITabBarItem给tabBarButton,给tabBarButton内容赋值
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
    // KVO：时刻监听一个对象的属性有没有改变
    // 给谁添加观察者
    // Observer:按钮
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
}

@end
