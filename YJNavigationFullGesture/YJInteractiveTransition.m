//
//  YJInteractiveTransition.m
//  自定义转场动画
//
//  Created by yangjie on 16/11/5.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "YJInteractiveTransition.h"
#import "YJPopAnimation.h"
@interface YJInteractiveTransition ()

/** 导航控制器 */
@property (nonatomic,weak) UINavigationController *navigationController;

/** 交互动画处理 */
@property (nonatomic,strong) UIPercentDrivenInteractiveTransition *popInteractiveTrasition;

@end

@implementation YJInteractiveTransition



- (instancetype)initWithViewController:(UIViewController*)viewController {

    
    self = [super init];
    if (self) {
        
        self.navigationController = (UINavigationController*)viewController;
        
        self.navigationController.delegate = self;
        
        self.popProgross = 0.5;
        
    }
    return self;
}



- (void)handlePopGesture:(UIPanGestureRecognizer *)popGesture {

    
    //滑动的占比0~1之间
    CGFloat progress = [popGesture translationInView:popGesture.view].x/popGesture.view.frame.size.width;
    
    progress = MIN(1.0, MAX(0.0, progress));
    
    
    switch (popGesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            //手势开始响应哦，创建交互动画对象
            self.popInteractiveTrasition = [[UIPercentDrivenInteractiveTransition alloc] init];
            
        
            //告诉控制器开始动画
            [self.navigationController popViewControllerAnimated:YES];
            
        }
            break;
            
        case UIGestureRecognizerStateChanged:{
        
            // 更新动画
            
            [self.popInteractiveTrasition updateInteractiveTransition:progress];
            
            
        }
            break;
            
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:{
        
         
            if (progress>self.popProgross) {
                
                [self.popInteractiveTrasition finishInteractiveTransition];
            }else {
            
                [self.popInteractiveTrasition cancelInteractiveTransition];
            }
            
            //记得将交互动画处理对象清空
            self.popInteractiveTrasition = nil;
            
        }
            break;
        default:
            break;
    }
    
}







- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController NS_AVAILABLE_IOS(7_0) {

    if([animationController isKindOfClass:[YJPopAnimation class]]){
    
        return self.popInteractiveTrasition;
    }else {
    
        return nil;
    }
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0) {
    
    
    if(operation == UINavigationControllerOperationPop){
    
        return [[YJPopAnimation alloc] init];
    }
    
    else {
    
        return nil;
    }

}


@end
