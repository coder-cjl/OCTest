//
//  MemoryTest.m
//  OCTest
//
//  Created by 陈建蕾 on 2021/3/15.
//

#import "MemoryTest.h"

@implementation MemoryTest

- (instancetype)init {
    if (self = [super init]) {
//        [self test1];
//        [self test2];
        [self test3];
    }
    return self;
}

- (void)test1 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int i = 0; i < 1000; i++) {
        dispatch_async(queue, ^{
            self.name = [NSString stringWithFormat:@"abcdefg"];
            NSLog(@"[test1] %p", self.name);
        });
    }
}

- (void)test2 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int i = 0; i < 1000; i++) {
        dispatch_async(queue, ^{
            self.name = [NSString stringWithFormat:@"abc"];
            NSLog(@"[test2] %p", self.name);
        });
    }
}

- (void)test3 {
    NSString *a = @"abc";
    NSString *b = [a mutableCopy];
    NSLog(@" a %@", a);
    NSLog(@" a [p] %p", a);
    NSLog(@" b %@", b);
    NSLog(@" b [p] %p", b);
    a = @"123";
    NSLog(@" a %@", a);
    NSLog(@" a [p] %p", a);
    NSLog(@" b %@", b);
    NSLog(@" b [p] %p", b);
}

@end
