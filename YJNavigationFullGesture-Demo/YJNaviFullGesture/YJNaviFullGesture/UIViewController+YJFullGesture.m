//
//  UIViewController+YJFullGesture.m
//  自定义转场动画
//
//  Created by yangjie on 16/11/5.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "UIViewController+YJFullGesture.h"
#import <objc/runtime.h>
@implementation UIViewController (YJFullGesture)

- (void)setYj_disabledFullGesture:(BOOL)yj_disabledFullGesture {

    objc_setAssociatedObject(self, @selector(yj_disabledFullGesture), @(yj_disabledFullGesture), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)yj_disabledFullGesture {

    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

@end
