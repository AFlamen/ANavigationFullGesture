//
//  UINavigationController+YJFullGesture.m
//  自定义转场动画
//
//  Created by yangjie on 16/11/5.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "UINavigationController+YJFullGesture.h"
#import "YJGestureDelegate.h"
#import "YJInteractiveTransition.h"
#import <objc/runtime.h>

@interface UINavigationController ()
// 手势代理
@property (nonatomic,strong) YJGestureDelegate *yj_gestureDelegate;

/** 交互动画处理者 */
@property (nonatomic,strong) YJInteractiveTransition *yj_interactiveTransition;

@end

@implementation UINavigationController (YJFullGesture)

+(void)load {

    //替换系统的方法
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
     
        Class class = [self class];
        
        SEL originSelector = @selector(viewDidLoad);
        SEL swizzledSelector = @selector(yj_viewDidLoad);
        
        Method originMethod = class_getInstanceMethod(class, originSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL succss = class_addMethod(class, originSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (succss) {
            
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        }
        else {
        
           
            method_exchangeImplementations(originMethod, swizzledMethod);
        }
        
        
        
    });
    
}




- (void)yj_viewDidLoad {

    [self yj_viewDidLoad];
    
    // 获取本身的手势并禁用
    UIGestureRecognizer *geture = self.interactivePopGestureRecognizer;
    
    geture.enabled = NO;
    
    //自定义pan手势
    
    UIView *getureView = geture.view;
    UIPanGestureRecognizer *popGesture = [[UIPanGestureRecognizer alloc] init];
    popGesture.delegate = self.yj_gestureDelegate;
    popGesture.maximumNumberOfTouches = 1;
    [getureView addGestureRecognizer:popGesture];
    
    self.yj_interactiveTransition = [[YJInteractiveTransition alloc] initWithViewController:self];
    
    self.yj_interactiveTransition.popProgross = self.yj_popProgress?self.yj_popProgress:0.5;
    
    [popGesture addTarget:self.yj_interactiveTransition action:@selector(handlePopGesture:)];
    

}


- (void)setYj_interactiveTransition:(YJInteractiveTransition *)yj_interactiveTransition {

    
    objc_setAssociatedObject(self, @selector(yj_interactiveTransition), yj_interactiveTransition, OBJC_ASSOCIATION_RETAIN);
}


- (YJInteractiveTransition*)yj_interactiveTransition {

    return objc_getAssociatedObject(self, @selector(yj_interactiveTransition));
}


- (void)setYj_popProgress:(float)yj_popProgress {

    self.yj_interactiveTransition.popProgross = yj_popProgress;
    objc_setAssociatedObject(self, @selector(yj_popProgress), @(yj_popProgress), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (float)yj_popProgress {

    return [objc_getAssociatedObject(self, @selector(yj_popProgress)) floatValue];
}


- (YJGestureDelegate*)yj_gestureDelegate {

    YJGestureDelegate *delegate = objc_getAssociatedObject(self, _cmd);
    
    if (!delegate) {
        
        
        delegate = [[YJGestureDelegate alloc] initWithViewController:self];
    
        objc_setAssociatedObject(self, _cmd, delegate, OBJC_ASSOCIATION_RETAIN);
    }
    
    return delegate;
    
}

@end
