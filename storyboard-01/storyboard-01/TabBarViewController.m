//
//  TabBarViewController.m
//  storyboard-01
//
//  Created by lance on 15/3/31.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "TabBarViewController.h"
#import "RoundButton.h"

@implementation TabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    RoundButton *tabButton = [RoundButton buttonWithType:UIButtonTypeCustom];
    tabButton.frame = CGRectMake(0.0, -20, 80.0, 80.0);
//    tabButton.clipsToBounds = YES;
    
    //    tabButton.center = self.tabBar.center;
    CGRect frame = self.tabBarController.tabBar.frame;
    tabButton.center = CGPointMake(CGRectGetWidth(frame) / 2.0, CGRectGetHeight(frame) - CGRectGetHeight(tabButton.frame) / 2.0);
    NSLog(@"%@~~~%@", NSStringFromCGPoint(tabButton.center), NSStringFromCGRect(frame));
    
    [self.tabBarController.tabBar addSubview:tabButton];
    
    [tabButton addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
}

- (void)test
{
    NSLog(@"test");
}

@end
