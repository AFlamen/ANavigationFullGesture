//
//  UIViewController+FullGesture.m
//  LibDemo
//
//  Created by yzl on 2020/2/20.
//  Copyright © 2020 Y&Y. All rights reserved.
//

#import "UIViewController+FullGesture.h"

#import <objc/runtime.h>


@implementation UIViewController (FullGesture)


-(void)setDisabledFullGesture:(BOOL)disabledFullGesture{
       objc_setAssociatedObject(self, @selector(disabledFullGesture), @(disabledFullGesture), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)disabledFullGesture {

    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
@end
