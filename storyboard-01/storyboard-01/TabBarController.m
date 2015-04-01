//
//  TabBarController.m
//  storyboard-01
//
//  Created by Lance Lan on 15/3/31.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "TabBarController.h"
#import "RoundButton.h"
#import "EmptyViewAction.h"

@implementation TabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    RoundButton *tabButton = [[RoundButton alloc] initWithFrame:CGRectMake(80, 80, 80.0, 80.0)];
    tabButton.clipsToBounds = YES;
    [tabButton addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tabButton];
    
    EmptyViewAction *translucentView = [[EmptyViewAction alloc] initWithFrame:self.view.bounds];
    translucentView.backgroundColor = [UIColor redColor];
    [self.view addSubview:translucentView];
    
    // doesn't work , because ,alpha <= 0.1,, hidden, or other
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(testAlphaView)];
    [translucentView addGestureRecognizer:tapGesture];
}

- (void)testAlphaView
{
    NSLog(@"test testAlphaView");
}

- (void)test:(UIButton *)button
{
    NSLog(@"test");
    
    [self logResponse:button];
}

- (void)logResponse:(UIResponder *)responder
{
    NSLog(@"\n the responder chain \n");
    NSMutableString *spaces = [NSMutableString stringWithCapacity:4];
    while (responder) {
        NSLog(@"%@----%@", spaces, [responder class]);
        [spaces appendFormat:@"----"];
        
        responder = responder.nextResponder;
    }
}

@end
