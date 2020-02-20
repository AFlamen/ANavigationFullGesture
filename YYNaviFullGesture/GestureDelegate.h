//
//  GestureDelegate.h
//  LibDemo
//
//  Created by yzl on 2020/2/20.
//  Copyright © 2020 Y&Y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface GestureDelegate : NSObject<UIGestureRecognizerDelegate>

- (id)initWithViewController:(UIViewController*)viewController;

@end

NS_ASSUME_NONNULL_END
