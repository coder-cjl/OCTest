//
//  SYAppDelegateEventManager.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/26.
//

#import "SYAppDelegateEventManager.h"

NSString * const KSYApplicationDidLoadTargetModuleCallName = @"KSYApplicationDidLoadTargetModuleCallName";

@interface SYAppDelegateEventManager ()
@property (nonatomic, strong) NSMutableArray <id<SYAppDelegateProtocol>>*arrays;
@property (nonatomic, assign) BOOL didLoad;
@end

@implementation SYAppDelegateEventManager

+ (instancetype)share {
    static SYAppDelegateEventManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [SYAppDelegateEventManager new];
    });
    return manager;
}

- (void)regist:(id<SYAppDelegateProtocol>)obj {
    if (!obj) { return; }
    if ([self.arrays containsObject:obj]) { return; }
    [self.arrays addObject:obj];
}

- (void)unRegist:(id<SYAppDelegateProtocol>)obj {
    if (!obj) { return; }
    if (![self.arrays containsObject:obj]) { return; }
    [self.arrays removeObject:obj];
}

- (void)unRegistAll {
    [self.arrays removeAllObjects];
}

- (void)targetModuleCall:(NSString *)name arg:(nullable id)arg {
    if ([name isEqualToString:KSYApplicationDidLoadTargetModuleCallName]) {
        if (self.didLoad) return;
        self.didLoad = YES;
    }
    
    for (id<SYAppDelegateProtocol> obj in self.arrays) {
        if ([obj respondsToSelector:_cmd]) {
            [obj targetModuleCall:name arg:arg];
        }
    }
}

#pragma mark UIApplicationDelegate
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
    for (id<SYAppDelegateProtocol> obj in self.arrays) {
        if ([obj respondsToSelector:_cmd]) {
            [obj application:application willFinishLaunchingWithOptions:launchOptions];
        }
    }
    return true;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
    for (id<SYAppDelegateProtocol> obj in self.arrays) {
        if ([obj respondsToSelector:_cmd]) {
            [obj application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
    return true;
}

- (NSMutableArray<id<SYAppDelegateProtocol>> *)arrays {
    if (!_arrays) {
        _arrays = [NSMutableArray array];
    }
    return _arrays;
}

@end
