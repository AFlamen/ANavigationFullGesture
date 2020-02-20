//
//  PopAnimation.h
//  LibDemo
//
//  Created by yzl on 2020/2/20.
//  Copyright © 2020 Y&Y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface PopAnimation : NSObject<UIViewControllerAnimatedTransitioning>

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

NS_ASSUME_NONNULL_END
