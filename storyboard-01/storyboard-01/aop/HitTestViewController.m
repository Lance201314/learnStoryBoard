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

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation HitTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    _testView = [[HitTestView alloc] initWithFrame:CGRectMake(20.0, 20.0, CGRectGetWidth(self.view.frame) - 20 * 2, 300.0)];
//    [self.view addSubview:_testView];
//    
//    TestHitView *testView = [[TestHitView alloc] initWithFrame:CGRectMake(60.0, 350.0, 100.0, 100)];
//    testView.backgroundColor = [UIColor redColor];
//    testView.alpha = 0.0;
//    [self.view addSubview:testView];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
- (IBAction)buttonTest:(UIButton *)button {
    NSLayoutConstraint *constraint = [button getContraintWithFirstAttribute:NSLayoutAttributeHeight firstItem:button view:button];
    NSLog(@"%f", constraint.constant);
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLayoutConstraint *constraint = [textField getContraintWithFirstAttribute:NSLayoutAttributeBottom firstItem:textField view:self.view];
    [UIView animateWithDuration:0.35 animations:^{
        constraint.constant -= 100.0f;
        [textField layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLayoutConstraint *constraint = [textField getContraintWithFirstAttribute:NSLayoutAttributeBottom firstItem:textField view:self.view];
    [UIView animateWithDuration:0.35 animations:^{
        constraint.constant += 100.0f;
        [textField layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

@end
