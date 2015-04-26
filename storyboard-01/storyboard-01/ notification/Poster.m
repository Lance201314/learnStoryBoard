//
//  Poster.m
//  storyboard-01
//
//  Created by Lance Lan on 15/4/26.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "Poster.h"

@implementation Poster

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        [self performSelectorInBackground:@selector(postNotification) withObject:nil];
    }
    
    return self;
}

- (void)postNotification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"test_notification" object:nil];
}

@end
