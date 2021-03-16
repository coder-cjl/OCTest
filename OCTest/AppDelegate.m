//
//  AppDelegate.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/26.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SYAppDelegateEventManager.h"
#import "Module1.h"
#import "Module2.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
    [[SYAppDelegateEventManager share] regist:[Module1 new]];
    [[SYAppDelegateEventManager share] regist:[Module2 new]];
    return [[SYAppDelegateEventManager share] application:application willFinishLaunchingWithOptions:launchOptions];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    return [[SYAppDelegateEventManager share] application:application didFinishLaunchingWithOptions:launchOptions];
}


@end
