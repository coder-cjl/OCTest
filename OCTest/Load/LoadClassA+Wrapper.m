//
//  LoadClassA+Wrapper.m
//  OCTest
//
//  Created by 陈建蕾 on 2021/3/12.
//

#import "LoadClassA+Wrapper.h"

@implementation LoadClassA (Wrapper)

//+ (void)load {
//    NSLog(@"%s", __func__);
//}
//
//+ (void)initialize {
//    NSLog(@"%s", __func__);
//}

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
