//
//  StaticTest.h
//  OCTest
//
//  Created by 陈建蕾 on 2021/3/12.
//

#import <Foundation/Foundation.h>
#import "StaticProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface StaticTest : NSObject<StaticProtocol>
@property (nonatomic, assign, getter=testPass) BOOL pass;
@property (nonatomic, assign, setter=testSetting:) NSString *set;
//@property (nonatomic, weak) int testage;
//@property (nonatomic, assign) UIButton *testView;
@end

NS_ASSUME_NONNULL_END
