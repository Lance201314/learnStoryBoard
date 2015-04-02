//
//  EmptyViewAction.m
//  storyboard-01
//
//  Created by lance on 15/4/1.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "EmptyViewAction.h"
#import <objc/objc-runtime.h>

@implementation EmptyViewAction

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.alpha = 0.0;
        
        method_exchangeImplementations(class_getInstanceMethod([self class], @selector(hitTest:withEvent:)), class_getInstanceMethod([self class], @selector(customEmpty_hitTest:withEvent:)));
    }
    
    return self;
}

// 可以不必，一上来就加到运行时
//+ (void)load
//{
//    method_exchangeImplementations(class_getInstanceMethod(self, @selector(hitTest:withEvent:)), class_getInstanceMethod(self, @selector(customEmpty_hitTest:withEvent:)));
//}

- (UIView *)customEmpty_hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *deliveredView = nil;
    if (CGRectContainsPoint(self.frame, point)) {
//        if ([self respondsToSelector:@selector(customEmpty_hitTest:withEvent:)]) {
//            deliveredView = [self customEmpty_hitTest:point withEvent:event];
//        } else {
//            deliveredView = [self hitTest:point withEvent:event];
//        }
        
        deliveredView = [self customEmpty_hitTest:point withEvent:event];
    }
    
    return deliveredView;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    return  [super hitTest:point withEvent:event];
}

@end
