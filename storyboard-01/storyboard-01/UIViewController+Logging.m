//
//  UIViewController+Logging.m
//  storyboard-01
//
//  Created by lance on 15/3/30.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "UIViewController+Logging.h"
#import <objc/objc-runtime.h>

@implementation UIViewController (Logging)

- (void)swizzled_viewDidAppear:(BOOL)animated
{
    // 运行时的代码，不会是递归方式调用的～
    [self swizzled_viewDidAppear:animated];
    
    if (![self isKindOfClass:[UINavigationController class]]) {
        NSLog(@"%@~~~~%@", NSStringFromClass([self class]), self.title);
    }
}

// 运行时，交换执行的方法
void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

+ (void)load
{
    swizzleMethod([self class], @selector(viewDidLoad), @selector(swizzled_viewDidAppear:));
}

@end
