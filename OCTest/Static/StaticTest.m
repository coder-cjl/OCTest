//
//  StaticTest.m
//  OCTest
//
//  Created by 陈建蕾 on 2021/3/12.
//

#import "StaticTest.h"

static inline void static_test() {
    NSLog(@"aaaa");
}

@implementation StaticTest
@synthesize name = _name;
@synthesize age = _age;

- (instancetype)init {
    if (self = [super init]) {
//        [self test1];
//        [self test2];
        [self test3];
    }
    return self;
}

- (void)test1 {
    static_test();
}

- (void)test2 {
    NSLog(@"%ld", (long)self.pass);
}

- (void)test3 {
    self.set = @"haha";
}

- (void)testSetting:(NSString *)set {
    _set = set;
    NSLog(@"set -- %@", set);
}

- (BOOL)testPass {
    return YES;
}

@end
