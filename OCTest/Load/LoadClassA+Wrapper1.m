//
//  LoadClassA+Wrapper1.m
//  OCTest
//
//  Created by 陈建蕾 on 2021/3/12.
//

#import "LoadClassA+Wrapper1.h"

@implementation LoadClassA (Wrapper1)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (void)testA {
    NSLog(@"%s", __func__);
}
#pragma clang diagnostic pop

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
+ (void)testB {
    NSLog(@"%s", __func__);
}
#pragma clang diagnostic pop

@end
