//
//  MainTabBarControllerMidButtonView.m
//  ProjectGenericFramework
//
//  Created by joe on 2016/12/15.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "MainTabBarControllerMidButtonView.h"

@interface MainTabBarControllerMidButtonView()
/** 覆盖住realybtn 的一个透明按钮 */
@property (nonatomic, strong) UIButton *coverBtn;
/** 实际要现实的btn */
@property (nonatomic, strong) UIButton *realyBtn;
@end
@implementation MainTabBarControllerMidButtonView

#pragma mark - life cycle
- (instancetype)init
{
    if (self = [super init]) {
        [self addSubview:self.realyBtn];
        [self addSubview:self.coverBtn];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.coverBtn.frame = self.bounds;
    CGFloat width = 40;
    CGFloat x = self.coverBtn.center.x - width * 0.5;
    CGFloat y = self.coverBtn.center.y - width * 0.5;
    self.realyBtn.frame = CGRectMake(x, y, width, width);
}
#pragma mark - delegate
#pragma mark - event response
- (void)coverBtnWithTouchDown
{
    [self.realyBtn setImage:[UIImage imageNamed:@"PlusBtnImage"] forState:UIControlStateNormal];
    [self.realyBtn setBackgroundImage:[UIImage imageNamed:@"PlusBtnImage"] forState:UIControlStateNormal];
}
- (void)coverBtnWithTouchUpInside
{
    [self changeBtnToNormal];
}
- (void)coverBtnWithTouchDragExit
{
    [self changeBtnToNormal];
}
#pragma mark - private methods
- (void)changeBtnToNormal
{
    [_realyBtn setImage:[UIImage imageNamed:@"PlusBtnImage"] forState:UIControlStateNormal];
    [_realyBtn setBackgroundImage:[UIImage imageNamed:@"PlusBtnImage"] forState:UIControlStateNormal];
}
#pragma mark - getters and setters
- (UIButton *)coverBtn
{
    if (_coverBtn == nil) {
        _coverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_coverBtn addTarget:self action:@selector(coverBtnWithTouchDown) forControlEvents:UIControlEventTouchDown];
        [_coverBtn addTarget:self action:@selector(coverBtnWithTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
        [_coverBtn addTarget:self action:@selector(coverBtnWithTouchDragExit) forControlEvents:UIControlEventTouchDragExit];
    }
    return _coverBtn;
}
- (UIButton *)realyBtn
{
    if (_realyBtn == nil) {
        _realyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self changeBtnToNormal];
    }
    return _realyBtn;
}
@end
