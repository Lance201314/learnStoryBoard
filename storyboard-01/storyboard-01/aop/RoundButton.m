//
//  RoundButton.m
//  storyboard-01
//
//  Created by Lance Lan on 15/3/31.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "RoundButton.h"
#import <objc/objc-runtime.h>

const static NSString *HitTestViewBlockKey = @"STHitTestViewBlockKey";

CGFloat distanceBetweenPoints(CGPoint pointA, CGPoint pointB)
{
    CGFloat x = pointB.x - pointA.x;
    CGFloat y = pointB.y - pointA.y;
    
    return sqrt( x * x + y * y);
}

@implementation RoundButton

+ (void)load
{
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(hitTest:withEvent:)), class_getInstanceMethod(self, @selector(custom2_hitTest:withEvent:)));
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor blueColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 40.0f;
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        
//        self.hitTestViewBlock = ^(CGPoint point, UIEvent *event, BOOL *returnSuper) {
//            CGPoint center = CGPointMake(CGRectGetWidth(frame)/ 2.0, CGRectGetHeight(frame) / 2.0);
//            if (distanceBetweenPoints(point, center) <= CGRectGetWidth(frame) / 2.0) {
//                *returnSuper = YES;
//            }
//            
//            return (UIView *)nil;
//        };
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame
{
    if (CGRectGetHeight(frame) != CGRectGetWidth(frame)) {
        frame.size.width = frame.size.height;
    }
    [super setFrame:frame];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    if (!view) {
        if ([self pointInside:point withEvent:event]) {
            view = self;
        }
    }
    
    return view;
}

- (UIView *)custom_hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *deliveredView = nil;
    
    if (self.hitTestViewBlock) {
        BOOL returnSuper = NO;
        deliveredView = self.hitTestViewBlock(point, event, &returnSuper);
        
        if (returnSuper) {
            deliveredView = [self custom_hitTest:point withEvent:event];
        }
    } else {
        deliveredView = [self hitTest:point withEvent:event];
    }
    
    return deliveredView;
}

- (UIView *)custom2_hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *deliveredView = nil;
    
    CGPoint center = CGPointMake(CGRectGetWidth(self.frame)/ 2.0, CGRectGetHeight(self.frame) / 2.0);
    if (distanceBetweenPoints(point, center) <= CGRectGetWidth(self.frame) / 2.0) {
        deliveredView = [self custom2_hitTest:point withEvent:event];
    }
    
    return deliveredView;
}

- (void)setHitTestViewBlock:(HitTestViewBlock)hitTestViewBlock
{
    objc_setAssociatedObject(self, (__bridge const void *)HitTestViewBlockKey, hitTestViewBlock, OBJC_ASSOCIATION_COPY);
}

- (HitTestViewBlock)hitTestViewBlock
{
    return objc_getAssociatedObject(self, (__bridge const void *)HitTestViewBlockKey);
}

@end
