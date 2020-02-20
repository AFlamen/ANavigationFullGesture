//
//  GestureDelegate.m
//  LibDemo
//
//  Created by yzl on 2020/2/20.
//  Copyright © 2020 Y&Y. All rights reserved.
//

#import "GestureDelegate.h"
#import "UIViewController+FullGesture.h"
@interface GestureDelegate ()

/** navi */
@property (nonatomic,weak) UINavigationController *navigationController;
@end
@implementation GestureDelegate

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
    
    if (topVC.disabledFullGesture) {
        // 关闭手势响应
        return NO;
    }
    return YES;
}
@end
