//
//  SYAppDelegateEventManager.h
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/26.
//

#import <Foundation/Foundation.h>
#import "SYAppDelegateProtocol.h"

NS_ASSUME_NONNULL_BEGIN

/** 该方法默认只走一遍, 在主viewController viewDidAppera 之后执行 */
extern NSString * const KSYApplicationDidLoadTargetModuleCallName;

@interface SYAppDelegateEventManager : NSObject<UIApplicationDelegate>

+ (instancetype)share;

- (void)regist:(id<SYAppDelegateProtocol>)obj;
- (void)unRegist:(id<SYAppDelegateProtocol>)obj;
- (void)unRegistAll;

/** 针对某一个功能，需要在进入该页面的时候再去调去初始化 */
- (void)targetModuleCall:(NSString *)name arg:(nullable id)arg;

@end

NS_ASSUME_NONNULL_END
