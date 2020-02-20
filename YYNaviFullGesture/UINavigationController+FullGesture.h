//
//  UINavigationController+FullGesture.h
//  LibDemo
//
//  Created by yzl on 2020/2/20.
//  Copyright © 2020 Y&Y. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+FullGesture.h"
NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (FullGesture)
/** 设置滑动手势的滑动比例0.0~1.0,默认为0.5 */
@property (nonatomic,assign) float popProgress;
@end

NS_ASSUME_NONNULL_END
