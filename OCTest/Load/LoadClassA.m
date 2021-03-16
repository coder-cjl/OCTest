//
//  LoadClassA.m
//  OCTest
//
//  Created by 陈建蕾 on 2021/3/12.
//

#import "LoadClassA.h"

@implementation LoadClassA

//+ (void)load {
//    NSLog(@"%s", __func__);
//}
//
//+ (void)initialize {
//    NSLog(@"%s", __func__);
//}

- (void)testA {
    NSLog(@"%s", __func__);
}

+ (void)testB {
    NSLog(@"%s", __func__);
}

@end
