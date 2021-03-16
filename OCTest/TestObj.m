//
//  TestObj.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/26.
//

#import "TestObj.h"

@implementation TestObj

- (instancetype)initWithName:(NSString *)name action:(TestAction)action {
    if (self = [super init]) {
        self.name = name;
        self.action = action;
    }
    return self;
}

// 10000000 00000000 00000000 01100100
// 11111111 11111111 11111111 10011100
// + 1
// 10000000 00000000 00000000 01100100
@end
