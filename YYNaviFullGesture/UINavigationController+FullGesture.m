//
//  UINavigationController+FullGesture.m
//  LibDemo
//
//  Created by yzl on 2020/2/20.
//  Copyright © 2020 Y&Y. All rights reserved.
//

#import "UINavigationController+FullGesture.h"
#import "GestureDelegate.h"
#import "InteractiveTransition.h"
#import <objc/runtime.h>

@interface UINavigationController ()
// 手势代理
@property (nonatomic,strong) GestureDelegate *gestureDelegate;

/** 交互动画处理者 */
@property (nonatomic,strong) InteractiveTransition *interactiveTransition;

@end


@implementation UINavigationController (FullGesture)
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
        }else {
            method_exchangeImplementations(originMethod, swizzledMethod);
       
        }
    });
    
}




- (void)viewDidLoad {

    [self viewDidLoad];
    
    // 获取本身的手势并禁用
    UIGestureRecognizer *geture = self.interactivePopGestureRecognizer;
    
    geture.enabled = NO;
    
    //自定义pan手势
    
    UIView *getureView = geture.view;
    UIPanGestureRecognizer *popGesture = [[UIPanGestureRecognizer alloc] init];
    popGesture.delegate = self.gestureDelegate;
    popGesture.maximumNumberOfTouches = 1;
    [getureView addGestureRecognizer:popGesture];
    
    self.interactiveTransition = [[InteractiveTransition alloc] initWithViewController:self];
    
    self.interactiveTransition.popProgross = self.popProgress?self.popProgress:0.5;
    
    [popGesture addTarget:self.interactiveTransition action:@selector(handlePopGesture:)];
    

}

-(void)setInteractiveTransition:(InteractiveTransition *)interactiveTransition{
    
    objc_setAssociatedObject(self, @selector(interactiveTransition), interactiveTransition, OBJC_ASSOCIATION_RETAIN);
}


- (InteractiveTransition*)interactiveTransition {

    return objc_getAssociatedObject(self, @selector(interactiveTransition));
}
-(void)setPopProgress:(float)popProgress{

    self.interactiveTransition.popProgross = popProgress;
    objc_setAssociatedObject(self, @selector(popProgress), @(popProgress), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (float)popProgress {

    return [objc_getAssociatedObject(self, @selector(popProgress)) floatValue];
}


- (GestureDelegate*)gestureDelegate {

    GestureDelegate *delegate = objc_getAssociatedObject(self, _cmd);
    
    if (!delegate) {
        
        delegate = [[GestureDelegate alloc] initWithViewController:self];
    
        objc_setAssociatedObject(self, _cmd, delegate, OBJC_ASSOCIATION_RETAIN);
    }
    
    return delegate;
    
}
@end
