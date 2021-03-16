//
//  ImportClassA.m
//  OCTest
//
//  Created by 陈建蕾 on 2021/3/11.
//

#import "ImportClassA.h"
#import "OCTest-Swift.h"

@implementation ImportClassA

- (void)sayHello {
    NSLog(@"say hello");
}

- (void)test1 {
    ImportClassB *b = [ImportClassB new];
    [b ocSayHello];
}

@end
