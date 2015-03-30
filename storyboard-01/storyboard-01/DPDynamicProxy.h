//
//  DPDynamicProxy.h
//  storyboard-01
//
//  Created by Lance Lan on 15/3/30.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPDynamicProtocol.h"

@interface DPDynamicProxy : NSProxy <DPDynamicProtocol>
{
    @private
    id<DPDynamicProtocol> _obj;
}

- (id)initWithObject:(id<DPDynamicProtocol>)obj;

@end
