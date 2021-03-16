//
//  TestObj.h
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define SYKit_Dispatch_Sync_Main(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#define SYKit_Dispatch_Async_Main(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

typedef enum : NSUInteger {
    TestActionNone = 0,
    TestActionFirtst,
    TestActionColor,
    TestActionTarget,
    TestActionKill,
    TestActionStackInfo,
    TestActionDate,
    TestActionPlay,
    TestActionMult,
    TestActionMP4,
    TestActionAppStatus,
    TestActionPages,
    TestActionPages2,
    TestActionPages3,
    TestActionCopy,
    TestActionStatic,
    TestActionLoad,
    TestActionLife,
    TestActionRunTime,
    TestActionMemory
} TestAction;

@interface TestObj : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) TestAction action;

- (instancetype)initWithName:(NSString *)name action:(TestAction)action;

@end

NS_ASSUME_NONNULL_END
