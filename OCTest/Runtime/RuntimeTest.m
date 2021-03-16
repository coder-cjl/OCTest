//
//  RuntimeTest.m
//  OCTest
//
//  Created by 陈建蕾 on 2021/3/12.
//

#import "RuntimeTest.h"
#import <objc/runtime.h>
#import "RunTimeTestB.h"

@implementation RuntimeTest

//- (void)test1 {
//    SEL s = NSSelectorFromString(@"say");
//    IMP a = class_getMethodImplementation(self.class, s);
//    (void *)(a, s, "ad");
//    [[NSBundle mainBundle] load];
//}

- (void)testA {
    NSLog(@"%s", __func__);
}

+ (void)testClassRun2 {
    NSLog(@"%s", __func__);
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    if (sel == @selector(testRun2)) {
        return NO;
    }
    return YES;
}

+ (NSMethodSignature *)instanceMethodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(testRun2)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}


- (BOOL)respondsToSelector:(SEL)aSelector {
    if (aSelector == @selector(testRun)) {
        return NO;
    } else if (aSelector == @selector(testRun2)) {
        return NO;
    }
    return [super respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(testRun)) {
        return [RunTimeTestB new];
    }
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


@end
