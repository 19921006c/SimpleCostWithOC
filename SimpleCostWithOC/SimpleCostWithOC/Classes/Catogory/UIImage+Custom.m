//
//  UIImage+Custom.m
//  SimpleCostWithOC
//
//  Created by joe on 2016/12/12.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "UIImage+Custom.h"

@implementation UIImage (Custom)

+ (instancetype)imageWithClearColor
{
    UIColor *color = [UIColor clearColor];
    CGRect rect = CGRectMake(0, 0, kScreenWidth, kNavigationBarHeight);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
