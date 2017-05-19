//
//  YJPopAnimation.m
//  自定义转场动画
//
//  Created by yangjie on 16/11/5.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "YJPopAnimation.h"

@implementation YJPopAnimation



- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {

    //返回动画的时间
    return 0.25;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {

    
    // 从哪个控制器pop
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    
    //到哪个控制器
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 添加视图到内容器上
    UIView *containerView = [transitionContext containerView];
    
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    
   
    //定义动画
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
       
         fromVC.view.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
    } completion:^(BOOL finished) {
        
        //动画结束一定要调用
        
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
    
    
    
    
    
    
}

@end
