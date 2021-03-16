//
//  RunTimeTestB.m
//  OCTest
//
//  Created by 陈建蕾 on 2021/3/15.
//

#import "RunTimeTestB.h"
#import <objc/runtime.h>

@implementation RunTimeTestB

- (void)testB {
    NSLog(@"%s", __func__);
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if (aSelector == @selector(testRun)) {
        class_addMethod(self, @selector(testRun), addTest, "v@:");
        return YES;
    }
    return [super respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {

    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(testRun)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%@",anInvocation);
}

void addTest(void) {
    NSLog(@"%s", __func__);
}

@end
