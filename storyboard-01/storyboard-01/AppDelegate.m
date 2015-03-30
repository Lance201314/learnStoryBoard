//
//  AppDelegate.m
//  storyboard-01
//
//  Created by Lance Lan on 15/3/4.
//  Copyright (c) 2015年 Lance Lan. All rights reserved.
//

#import "AppDelegate.h"
#import "DPNormalObject.h"
#import "DPDynamicProxy.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 一开始注入aop面向切面
    // http://suenblog.duapp.com/blog/100010/iOS%E4%B8%AD%E7%9A%84%E2%80%9C%E9%9D%A2%E5%90%91%E5%88%87%E9%9D%A2%E2%80%9D%E5%BC%8F%E7%BC%96%E7%A8%8B
    
    // 每个想要拥有此功能的对象，必须实现对应的协议
    id<DPDynamicProtocol> obj = [[DPDynamicProxy alloc] initWithObject:[[DPNormalObject alloc] init]];
    [obj doSomthing];
    [obj doOtherthing];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
