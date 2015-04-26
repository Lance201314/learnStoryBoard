//
//  ViewController.m
//  storyboard-01
//
//  Created by Lance Lan on 15/3/4.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//


#import "ViewController.h"

#define TEST_NOTIFICATION  @"testNOtification"

@interface ViewController () <NSMachPortDelegate>

@property (nonatomic, strong) NSMutableArray *notifications;
@property (nonatomic, strong) NSThread *notificationThread;
@property (nonatomic, strong) NSLock *notificationLock;
@property (nonatomic, strong) NSMachPort *notificationPort;

@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.notifications = [[NSMutableArray alloc] init];
    self.notificationLock = [[NSLock alloc] init];
    self.notificationThread = [NSThread currentThread];
    self.notificationPort = [[NSMachPort alloc] init];
    self.notificationPort.delegate = self;
    
    [[NSRunLoop currentRunLoop] addPort:self.notificationPort forMode:(__bridge NSString *)kCFRunLoopCommonModes];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(processNotification:) name:TEST_NOTIFICATION object:nil];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:TEST_NOTIFICATION object:nil];
    });
}

- (void)handleMachMessage:(void *)msg
{
    [_notificationLock lock];
    
    while ([_notifications count]) {
        NSNotification *notification = [_notifications objectAtIndex:0];
        [_notifications removeObjectAtIndex:0];
        [_notificationLock unlock];
        
        [self processNotification:notification];
        [self.notificationLock lock];
    }
    
    [_notificationLock unlock];
}

- (void)processNotification:(NSNotification *)notification
{
    if ([NSThread currentThread] != _notificationThread) {
        [_notificationLock lock];
        [_notifications addObject:notification];
        [_notificationLock unlock];
        [_notificationPort sendBeforeDate:[NSDate date] components:nil from:nil reserved:0];
        
    } else {
        NSLog(@"current thread = %@", [NSThread currentThread]);
        
        NSLog(@"process notification");
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    NSLog(@"why is me ?");
//    
//    NSLog(@"current thread = %@", [NSThread currentThread]);
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:TEST_NOTIFICATION object:nil];
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [[NSNotificationCenter defaultCenter] postNotificationName:TEST_NOTIFICATION object:nil];
//    });
}

- (void)handleNotification:(NSNotification *)notification
{
    NSLog(@"current thread = %@", [NSThread currentThread]);
    
    NSLog(@"test notification");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindSegue:(UIStoryboardSegue *)segue
{
    NSLog(@"%@", NSStringFromClass([segue.destinationViewController class]));
}

- (IBAction)touchButton:(UIButton *)sender {
    if ([[sender titleForState:UIControlStateNormal] isEqual:@"b"]) {
        [sender setTitle:@"test button info" forState:UIControlStateNormal];
    } else {
        [sender setTitle:@"b" forState:UIControlStateNormal];
    }
}

@end
