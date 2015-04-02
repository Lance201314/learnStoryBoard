  //
//  CustomHitTestView.m
//  storyboard-01
//
//  Created by lance on 15/4/1.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "CustomHitTestView.h"
#import <objc/objc-runtime.h>

#define CustomHitTestViewKey @"CustomHitTestViewKey"

@implementation CustomHitTestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
//        method_exchangeImplementations(class_getInstanceMethod([self class], @selector(hitTest:withEvent:)), class_getInstanceMethod([self class], @selector(custom_hitTest:withEvent:)));
    }
    
    return self;
}

+ (void)load
{
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(hitTest:withEvent:)),class_getInstanceMethod(self, @selector(custom_hitTest:withEvent:)));
}

- (UIView *)custom_hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *deliveredView = nil;
    BOOL returnSuper = NO;
    if ([self respondsToSelector:@selector(hitTestViewBlock)]) {
        deliveredView = self.hitTestViewBlock(point, event, &returnSuper);
        if (returnSuper) {
            deliveredView = [self custom_hitTest:point withEvent:event];
        }
        
    } else {
        deliveredView = [self hitTest:point withEvent:event];
    }
    
    return deliveredView;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
   return [super hitTest:point withEvent:event];
}

- (void)setHitTestViewBlock:(CustomHitTestViewBlock)hitTestViewBlock
{
    objc_setAssociatedObject(self, (__bridge const void *)CustomHitTestViewKey, hitTestViewBlock, OBJC_ASSOCIATION_COPY);
}

- (CustomHitTestViewBlock)hitTestViewBlock
{
    return objc_getAssociatedObject(self, (__bridge const void *)CustomHitTestViewKey);
}

@end
