//
//  RoundButton.m
//  storyboard-01
//
//  Created by Lance Lan on 15/3/31.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "RoundButton.h"

@implementation RoundButton

- (void)setFrame:(CGRect)frame
{
    if (CGRectGetHeight(frame) != CGRectGetWidth(frame)) {
        frame.size.width = frame.size.height;
    }
    [super setFrame:frame];
    
    self.backgroundColor = [UIColor redColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 40.0f;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    
    return self;
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

@end
