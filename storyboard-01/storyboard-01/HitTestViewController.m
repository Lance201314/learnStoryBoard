//
//  HitTestViewController.m
//  storyboard-01
//
//  Created by lance on 15/3/31.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "HitTestViewController.h"
#import "HitTestView.h"
#import "TestHitView.h"

@interface HitTestViewController ()
{
    HitTestView *_testView;
}

@end

@implementation HitTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _testView = [[HitTestView alloc] initWithFrame:CGRectMake(20.0, 20.0, CGRectGetWidth(self.view.frame) - 20 * 2, 300.0)];
    [self.view addSubview:_testView];
    
    TestHitView *testView = [[TestHitView alloc] initWithFrame:CGRectMake(60.0, 350.0, 100.0, 100)];
    testView.backgroundColor = [UIColor redColor];
    testView.alpha = 0.0;
    [self.view addSubview:testView];
}

@end
