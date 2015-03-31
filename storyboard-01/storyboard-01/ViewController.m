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
    
    // 调用一次，多次执行～
    [UIViewController load];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchButton:(UIButton *)sender {
    if ([[sender titleForState:UIControlStateNormal] isEqual:@"b"]) {
        [sender setTitle:@"test button info" forState:UIControlStateNormal];
    } else {
        [sender setTitle:@"b" forState:UIControlStateNormal];
    }
}

@end
