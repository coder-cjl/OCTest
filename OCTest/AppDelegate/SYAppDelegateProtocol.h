//
//  SYAppDelegateProtocol.h
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/26.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SYAppDelegateProtocol <UIApplicationDelegate>

- (void)targetModuleCall:(NSString *)name arg:(nullable id)arg;

@end

@protocol SYAppDelegateAction <NSObject>

@end

NS_ASSUME_NONNULL_END
