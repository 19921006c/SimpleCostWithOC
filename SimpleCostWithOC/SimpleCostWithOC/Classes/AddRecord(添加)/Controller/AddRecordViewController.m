//
//  AddRecordViewController.m
//  SimpleCostWithOC
//
//  Created by joe on 2016/12/13.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "AddRecordViewController.h"

@interface AddRecordViewController ()

@property (nonatomic, strong) UIButton *changeBackgroundBtn;
@property (nonatomic, assign) BOOL mark;
@end

@implementation AddRecordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self.view addSubview:self.changeBackgroundBtn];
    self.view.backgroundColor = [UIColor whiteColor];
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    self.changeBackgroundBtn.frame = CGRectMake(0, 0, 100, 100);
//}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//
//- (void)changeBackgroundBtnAction
//{
////    self.mark = !self.mark;
////    [BackgroundImageView sharedInstance].image = [UIImage imageNamed:[NSString stringWithFormat:@"backgroundImage_%d",self.mark]];
//}
//- (UIButton *)changeBackgroundBtn
//{
//    if (_changeBackgroundBtn == nil) {
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button setTitle:@"改变背景图片" forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(changeBackgroundBtnAction) forControlEvents:UIControlEventTouchUpInside];
//        _changeBackgroundBtn = button;
//    }
//    return _changeBackgroundBtn;
//}
@end
