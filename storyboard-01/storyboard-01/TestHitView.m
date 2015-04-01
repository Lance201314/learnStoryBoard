//
//  TestHitView.m
//  storyboard-01
//
//  Created by lance on 15/4/1.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "TestHitView.h"

@implementation TestHitView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        __weak TestHitView *weakSelf = self;
        self.hitTestViewBlock = ^(CGPoint point, UIEvent *event, BOOL *returnSuper) {
            if ([weakSelf pointInside:point withEvent:event]) {
                [weakSelf test];
                
                *returnSuper = YES;
            }
            
            return (UIView *)nil;
        };
    }
    
    return self;
}

- (void)test
{
    NSLog(@"testetetetetetet");
}

@end
