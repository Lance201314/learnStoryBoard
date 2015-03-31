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

// 替换的方法，一般用于log日志等功能
- (void)swizzled_viewWillAppear:(BOOL)animated
{
    // 运行时的代码，不会是递归方式调用的～
    [self swizzled_viewWillAppear:animated];
    
    if (![self isKindOfClass:[UINavigationController class]] && ![NSStringFromClass([self class]) isEqualToString:@"UIInputWindowController"]) {
        if (self.title == nil) {
            if (self.nibName) {
                UIViewController *viewController = [[UIViewController alloc] initWithNibName:self.nibName bundle:nil];
                NSLog(@"%@~~~~%@", NSStringFromClass([viewController class]), viewController.title);
            }
        } else {
            NSLog(@"%@~~~~%@", NSStringFromClass([self class]), self.title);
        }
    }
}

// 替换的方法，一般用于log日志等功能
- (void)swizzled_viewDidDisappear:(BOOL)animated
{
    // 运行时的代码，不会是递归方式调用的～
    [self swizzled_viewDidDisappear:animated];
    
    if (![self isKindOfClass:[UINavigationController class]] && ![NSStringFromClass([self class]) isEqualToString:@"UIInputWindowController"]) {
        NSLog(@"disappear %@~~~~%@", NSStringFromClass([self class]), self.title);
    }
}

// 运行时，交换执行的方法
void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    // 原始方法
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    // 替换方法
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // 对一个类新增一个方法，返回新增方法是否成功, 目的是为后面替换方法。
    BOOL didAddMethod = class_addMethod(class, swizzledSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        // 如果添加成功，则替换实现方法体
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        // 添加失败，还原替换
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

// NSObject的方法，加载到内存中
+ (void)load
{
    swizzleMethod([self class], @selector(viewWillAppear:), @selector(swizzled_viewWillAppear:));
    swizzleMethod([self class], @selector(viewWillDisappear:), @selector(swizzled_viewDidDisappear:));
}

@end
