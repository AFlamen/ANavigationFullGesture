//
//  InteractiveTransition.h
//  LibDemo
//
//  Created by yzl on 2020/2/20.
//  Copyright © 2020 Y&Y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface InteractiveTransition : NSObject<UINavigationControllerDelegate>
// 初始化方法
- (instancetype)initWithViewController:(UIViewController*)viewController;

/** pop返回比例0.0~1.0,默认为0.5 */
@property (nonatomic,assign)CGFloat popProgross;

// 全屏手势处理方法
- (void)handlePopGesture:(UIPanGestureRecognizer*)popGesture;

- (UIPercentDrivenInteractiveTransition*)popInteractiveTrasition;

@end

NS_ASSUME_NONNULL_END
