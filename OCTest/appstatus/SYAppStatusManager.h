//
//  SYAppStatusManager.h
//  SYTech
//
//  Created by 陈建蕾 on 2020/12/9.
//

#import <Foundation/Foundation.h>

/** 接管appStatus状态，统一管理 */
@protocol SYAppStatusDelegate <NSObject>
@optional
- (void)sy_appStatus_didBecomeActive:(NSNotification *)notification;
- (void)sy_appStatus_didEnterBackground:(NSNotification *)notification;
- (void)sy_appStatus_willRegistActive:(NSNotification *)notification;
@end

@interface SYAppStatusManager : NSObject

+ (instancetype)manager;

- (void)regist:(id<SYAppStatusDelegate>)obj;
- (void)unRegist:(id<SYAppStatusDelegate>)obj;

@end
