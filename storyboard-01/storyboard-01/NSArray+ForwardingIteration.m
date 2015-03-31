//
//  NSArray+ForwardingIteration.m
//  storyboard-01
//
//  Created by lance on 15/3/31.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "NSArray+ForwardingIteration.h"

@implementation NSArray (ForwardingIteration)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        for (id obj in self) {
            if ((signature = [obj methodSignatureForSelector:aSelector])) {
                break;
            }
        }
    }
    
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    for (id obj in self) {
        [anInvocation invokeWithTarget:obj];
    }
}

@end
