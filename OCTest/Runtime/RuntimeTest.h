//
//  RuntimeTest.h
//  OCTest
//
//  Created by 陈建蕾 on 2021/3/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RuntimeTest : NSObject

/** SEL */
//- (void)say:(int)a;
//- (void)say:(NSString *)a;

- (void)testRun;
- (void)testA;
+ (void)testRun2;
+ (void)testClassRun2;

@end

NS_ASSUME_NONNULL_END
