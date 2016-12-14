//
//  BackgroundImageView.m
//  SimpleCostWithOC
//
//  Created by joe on 2016/12/13.
//  Copyright © 2016年 joe. All rights reserved.
//

#import "BackgroundImageView.h"

@implementation BackgroundImageView

+ (BackgroundImageView *)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIImageView *imageView = [[self alloc] initWithImage:[UIImage imageNamed:@"backgroundImage_0"]];
        imageView.tag = 100001;
        sharedInstance = imageView;
    });
    return sharedInstance;
}

@end
