//
//  ViewController.m
//  storyboard-01
//
//  Created by Lance Lan on 15/3/4.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        
        CGFloat topWith = (kScreenHeight - 60.0) / 2.0;
        
        CGRect frame = _leftView.frame;
        frame.size.width = topWith;
        frame.size.height = 120.0f;
        _leftView.frame = frame;
        
        frame = _rightView.frame;
        frame.origin.x = CGRectGetMaxX(_leftView.frame) + 20.0f;
        frame.size.width = topWith;
        frame.size.height = 120.0f;
        _rightView.frame = frame;
        
        CGFloat height = kScreenWidth - CGRectGetMaxY(_leftView.frame) - 2 * 20;
        
        frame = _bottomView.frame;
        frame.origin.y = CGRectGetMaxY(_leftView.frame) + 20.0f;
        frame.size.width = kScreenHeight - 20 * 2;
        frame.size.height = height;
        _bottomView.frame = frame;
        
    } else {
        
        CGRect frame = _leftView.frame;
        frame.size.width = 130.0f;
        frame.size.height = 200.0f;
        _leftView.frame = frame;
        
        frame = _rightView.frame;
        frame.origin.x = CGRectGetMaxX(_leftView.frame) + 20.0f;
        frame.size.width = 130.0f;
        frame.size.height = 200.0f;
        _rightView.frame = frame;
        
        frame = _bottomView.frame;
        frame.origin.y = CGRectGetMaxY(_leftView.frame) + 20.0f;
        frame.size.width = 280.0f;
        frame.size.height = 200.0f;
        _bottomView.frame = frame;
        
    }
}

@end
