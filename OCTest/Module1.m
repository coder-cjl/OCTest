//
//  Module1.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/26.
//

#import "Module1.h"
#import <UserNotifications/UserNotifications.h>
#import "SYMonitor.h"

NSString * const SYApplicationTargetModule1Name = @"SYApplicationTargetModule1Name";

@interface Module1 ()

@end

@implementation Module1

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
//    NSLog(@"%s", __FUNCTION__);
//    [[SYMonitor share] begin];
    return true;
}

- (void)targetModuleCall:(NSString *)name arg:(id)arg {
    NSLog(@"%@", arg);
}

//- (void)targetModuleCall:(NSString *)name arg:(id)arg {
//    if ([name isEqualToString:SYApplicationTargetModule1Name]) {
//        NSLog(@"%@", arg);
////        [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
////
////        }];
//    }
//}

@end
