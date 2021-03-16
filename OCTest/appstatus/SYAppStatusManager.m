//
//  SYAppStatusManager.m
//  SYTech
//
//  Created by 陈建蕾 on 2020/12/9.
//

#import "SYAppStatusManager.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface SYAppStatusManager ()
@property (nonatomic, strong) NSHashTable *table;
@end

@implementation SYAppStatusManager

+ (instancetype)manager {
    static SYAppStatusManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [SYAppStatusManager new];
    });
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
        [self _addObserver];
    }
    return self;
}

#pragma mark Private
- (void)_addObserver {
    @weakify(self);
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationDidBecomeActiveNotification object:nil] subscribeNext:^(NSNotification *x) {
        @strongify(self);
        for (id<SYAppStatusDelegate> obj in self.table) {
            if ([obj respondsToSelector:@selector(sy_appStatus_didBecomeActive:)]) {
                [obj sy_appStatus_didBecomeActive:x];
            }
        }
    }];
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil] subscribeNext:^(NSNotification *x) {
        @strongify(self);
        for (id<SYAppStatusDelegate> obj in self.table) {
            if ([obj respondsToSelector:@selector(sy_appStatus_didEnterBackground:)]) {
                [obj sy_appStatus_didEnterBackground:x];
            }
        }
    }];
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIApplicationWillResignActiveNotification object:nil] subscribeNext:^(NSNotification *x) {
        @strongify(self);
        for (id<SYAppStatusDelegate> obj in self.table) {
            if ([obj respondsToSelector:@selector(sy_appStatus_willRegistActive:)]) {
                [obj sy_appStatus_willRegistActive:x];
            }
        }
    }];
    
}

#pragma mark Public
- (void)regist:(id<SYAppStatusDelegate>)obj {
    if ([self.table containsObject:obj]) { return; }
    [self.table addObject:obj];
}

- (void)unRegist:(id<SYAppStatusDelegate>)obj {
    if (![self.table containsObject:obj]) { return; }
    [self.table removeObject:obj];
}

#pragma mark Set & Get
- (NSHashTable *)table {
    if (!_table) {
        _table = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
    }
    return _table;
}
@end
