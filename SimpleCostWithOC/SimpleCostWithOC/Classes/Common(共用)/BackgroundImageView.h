//
//  BackgroundImageView.h
//  SimpleCostWithOC
//
//  Created by joe on 2016/12/13.
//  Copyright © 2016年 joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackgroundImageView : UIImageView

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

+ (BackgroundImageView *)sharedInstance;
@end
