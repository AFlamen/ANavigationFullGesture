//
//  YJGestureDelegate.m
//  自定义转场动画
//
//  Created by yangjie on 16/11/5.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "YJGestureDelegate.h"
#import "UIViewController+YJFullGesture.h"
@interface YJGestureDelegate ()

/** navi */
@property (nonatomic,weak) UINavigationController *navigationController;
@end

@implementation YJGestureDelegate
- (id)initWithViewController:(UIViewController*)viewController {

    
    if (self = [super init]) {
        
        
        self.navigationController = (UINavigationController*)viewController;
    }
    
    return self;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if (self.navigationController.viewControllers.count<=1) {
//        当前控制器为根控制器
        return NO;
    }
    
    if ([[self.navigationController valueForKey:@"_isTransitioning"] boolValue]) {
        
        //正在执行动画
        return NO;
    }
    
    UIViewController *topVC = self.navigationController.viewControllers.lastObject;
    
    if (topVC.yj_disabledFullGesture) {
        // 关闭手势响应
        return NO;
    }
    
   
    return YES;
}

@end
