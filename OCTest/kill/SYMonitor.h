//
//  SYMonitor.h
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYMonitor : NSObject

+ (instancetype)share;
- (void)begin;
- (void)stop;
- (void)beginFPS;
- (void)stopFPS;

@end

NS_ASSUME_NONNULL_END
