//
//  UINavigationBar+BackgroundColor.h
//  storyboard-01
//
//  Created by lance on 15/4/14.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (BackgroundColor)

@property (nonatomic, strong) UIView *overlay;

- (void)ll_setBackgroundColor:(UIColor *)backgroundColor;

@end
