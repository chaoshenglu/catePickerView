//
//  AppDelegate.m
//  catePickerView
//
//  Created by lixiang on 2017/6/12.
//  Copyright © 2017年 lixiang. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *homeVc = [ViewController new];
    self.window.rootViewController = homeVc;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
