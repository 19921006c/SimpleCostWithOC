//
//  BaseViewController.m
//  SimpleCostWithOC
//
//  Created by joe on 2016/12/8.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation BaseViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.imageView = [BackgroundImageView sharedInstance];
//    [self.view addSubview:self.imageView];
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    BOOL isHas = NO;
//    for (UIView *view in self.view.subviews) {
//        if (view.tag == 100001) {
//            isHas = YES;
//        }
//    }
//    if (isHas) {//有背景图片
//    }else{//没有
//        [self.view addSubview:[BackgroundImageView sharedInstance]];
//    }
//    
//    self.imageView.frame = self.view.bounds;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
}
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroundImage_0"]];
//    [self.view addSubview:imageView];
//    
//    self.imageView = imageView;
//}
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    
//    self.imageView.frame = self.view.bounds;
//}
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    
//}
#pragma mark - delegate
#pragma mark - event response
#pragma mark - private methods
#pragma mark - getters and setters

@end
