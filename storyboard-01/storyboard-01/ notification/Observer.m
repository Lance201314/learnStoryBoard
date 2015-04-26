//
//  Observer.m
//  storyboard-01
//
//  Created by Lance Lan on 15/4/26.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "Observer.h"
#import "Poster.h"

@interface Observer ()
{
    Poster *_poster;
}

@end

@implementation Observer

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _poster = [[Poster alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"test_notification" object:nil];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    NSLog(@"Observer dealloc");
}

- (void)handleNotification:(NSNotification *)notification
{
    NSLog(@"handle notification begin");
    sleep(1);
    NSLog(@"handle notification end");
    
    self.i = 10;
}

@end
