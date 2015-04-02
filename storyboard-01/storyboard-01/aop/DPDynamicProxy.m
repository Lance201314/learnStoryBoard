//
//  DPDynamicProxy.m
//  storyboard-01
//
//  Created by Lance Lan on 15/3/30.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "DPDynamicProxy.h"

@implementation DPDynamicProxy

- (id)initWithObject:(id<DPDynamicProtocol>)obj
{
    _obj = obj;
    
    return self;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    if (_obj) {
        NSLog(@"proxy invocation obj method: %s", __func__);
        
        [invocation setTarget:_obj];
        [invocation invoke];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    if ([_obj isKindOfClass:[NSObject class]]) {
        return [(NSObject *)_obj methodSignatureForSelector:sel];
    }
    
    return [super methodSignatureForSelector:sel];
}

- (void)doSomthing
{
    NSLog(@"proxy do something");
    
    [_obj doSomthing];
}

- (void)doOtherthing
{
    NSLog(@"proxy do doOtherthing");
    
    [_obj doOtherthing];
}

@end
