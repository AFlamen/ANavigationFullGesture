//
//  UIViewController+FullGesture.h
//  LibDemo
//
//  Created by yzl on 2020/2/20.
//  Copyright © 2020 Y&Y. All rights reserved.
//

#import <AppKit/AppKit.h>


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (FullGesture)
/** 需要展示的控制器中是否关闭全屏手势，默认为NO */
@property (nonatomic,assign) BOOL disabledFullGesture;
@end

NS_ASSUME_NONNULL_END
