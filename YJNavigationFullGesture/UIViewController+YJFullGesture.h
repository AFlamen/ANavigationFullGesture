//
//  UIViewController+YJFullGesture.h
//  自定义转场动画
//
//  Created by yangjie on 16/11/5.
//  Copyright © 2016年 yj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (YJFullGesture)
/** 需要展示的控制器中是否关闭全屏手势，默认为NO */
@property (nonatomic,assign) BOOL yj_disabledFullGesture;

@end
