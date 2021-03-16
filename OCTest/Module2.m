//
//  Module2.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/26.
//

#import "Module2.h"
#import "SYAppStatusManager.h"

@implementation Module2

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
//    NSLog(@"%s", __FUNCTION__);
    [SYAppStatusManager manager];
    return true;
}

- (void)applicationDidLoadCall {
    NSLog(@"%s", __FUNCTION__);
}

@end
