//
//  UINavigationController+YJFullGesture.h
//  自定义转场动画
//
//  Created by yangjie on 16/11/5.
//  Copyright © 2016年 yj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+YJFullGesture.h"
@interface UINavigationController (YJFullGesture)

/** 设置滑动手势的滑动比例0.0~1.0,默认为0.5 */
@property (nonatomic,assign) float yj_popProgress;
@end
