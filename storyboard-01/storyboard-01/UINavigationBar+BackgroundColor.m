//
//  UINavigationBar+BackgroundColor.m
//  storyboard-01
//
//  Created by lance on 15/4/14.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "UINavigationBar+BackgroundColor.h"
#import <objc/runtime.h>

@implementation UINavigationBar (BackgroundColor)

static char overlayKey;

- (UIView *)overlay
{
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)ll_setBackgroundColor:(UIColor *)backgroundColor
{
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage new]];
        
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0.0, -20.0, CGRectGetWidth([UIScreen mainScreen].bounds), 64.0)];
        [self insertSubview:self.overlay atIndex:0];
        
        self.overlay.backgroundColor = backgroundColor;
    }
}

@end
