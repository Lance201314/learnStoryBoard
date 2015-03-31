//
//  HitTestView.m
//  storyboard-01
//
//  Created by lance on 15/3/31.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "HitTestView.h"

@implementation HitTestView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame) / 2);
        button.tag = 10001;
        button.backgroundColor = [UIColor grayColor];
        [button setTitle:@"Button1" forState:UIControlStateNormal];
        [self addSubview:button];
        [button addTarget:self action:@selector(_buttonActionFired:) forControlEvents:UIControlEventTouchDown];
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button2.frame = CGRectMake(0, CGRectGetHeight(frame) / 2, CGRectGetWidth(frame), CGRectGetHeight(frame) / 2);
        button2.tag = 10002;
        button2.backgroundColor = [UIColor darkGrayColor];
        [button2 setTitle:@"Button2" forState:UIControlStateNormal];
        [self addSubview:button2];
        [button2 addTarget:self action:@selector(_buttonActionFired:) forControlEvents:UIControlEventTouchDown];
    }
    
    return self;
}

- (void)_buttonActionFired:(UIButton *)button
{
    NSLog(@"=====Button Titled %@ ActionFired ", [button titleForState:UIControlStateNormal]);
    
    [self logResponderChain:button];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [super hitTest:point withEvent:event];
    if (hitView == [self viewWithTag:10001]) {
        return [self viewWithTag:10002];
    }
    
    return hitView;
}

// 事件响应链
- (void)logResponderChain:(UIResponder *)responder
{
    NSLog(@"\n the responder chain \n");
    NSMutableString *spaces = [NSMutableString stringWithCapacity:4];

    while (responder) {
        NSLog(@"%@%@", spaces, responder.class);
        
        responder = responder.nextResponder;
        
        [spaces appendFormat:@"----"];
    }
}

@end
