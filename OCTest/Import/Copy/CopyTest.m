//
//  CopyTest.m
//  OCTest
//
//  Created by 陈建蕾 on 2021/3/9.
//

#import "CopyTest.h"
#import "StaticTest.h"

@interface CopyTest ()
@property (nonatomic, strong) NSArray *strArr;
@property (nonatomic, copy) NSMutableArray *copArr;
@property (nonatomic, strong) NSString *strNss;
@end

@implementation CopyTest

- (instancetype)init {
    if (self = [super init]) {
//        [self test5];
        [self test6];
    }
    return self;
}

- (void)test6 {
    NSString *a = @"123";
    NSMutableString *mua = [NSMutableString stringWithString:a];
    self.strNss = mua;
    NSLog(@"\na - %@ p - %p \nmua - %@ p - %p\nstr - %@ p - %p", a, a, mua, mua, self.strNss, self.strNss);
    [mua appendString:@"456"];
    NSLog(@"\na - %@ p - %p \nmua - %@ p - %p\nstr - %@ p - %p", a, a, mua, mua, self.strNss, self.strNss);
    
//    self.strNss = @"hello";
//    NSString *a = self.strNss;
//    NSLog(@"a %@", a);
//    NSLog(@"a [p] %p", a);
//    NSLog(@"str %@", self.strNss);
//    NSLog(@"str [p] %p", self.strNss);
//    self.strNss = @"world";
//    NSLog(@"a %@", a);
//    NSLog(@"a [p] %p", a);
//    NSLog(@"str %@", self.strNss);
//    NSLog(@"str [p] %p", self.strNss);
//    self.strArr = @[@"1", @"2"];
//    NSLog(@"%@", self.strArr);
//
//    self.copArr = [NSMutableArray array];
//    [self.copArr addObject:@"1"];
//    [self.copArr addObject:@"2"];
//    [self.copArr addObject:@"3"];
//    NSLog(@"%@", self.copArr);
}

- (void)test1 {
    NSString *copy = @"hello";
    NSLog(@"%p", copy);
    NSString *acopy = [copy copy];
    NSLog(@"%@", acopy);
    NSLog(@"%p", acopy);
    NSMutableString *mCopy = [copy mutableCopy];
    NSLog(@"%@", mCopy);
    NSLog(@"%p", mCopy);
    [mCopy appendString:@"world"];
    NSLog(@"%@", mCopy);
    NSLog(@"%p", mCopy);
}

- (void)test2 {
    NSMutableString *a = [NSMutableString stringWithString:@"hello"];
    NSString *ca = [a copy];
    NSString *cca =  [ca copy];
    NSMutableString *mcca = [ca mutableCopy];
    id d = a;
    NSLog(@"ca - %@", ca);
    NSLog(@"ca p - %p", ca);
    NSLog(@"cca - %@", cca);
    NSLog(@"cca p - %p", cca);
    NSLog(@"mcca - %@", mcca);
    NSLog(@"mcca p - %p", mcca);
    NSLog(@"a - %@", a);
    NSLog(@"a p - %@", a);
    NSLog(@"d - %@", d);
    NSLog(@"d[p] - %p", d);
    NSLog(@"===============");
    [a replaceOccurrencesOfString:@"world" withString:@"hello" options:0 range:NSMakeRange(0, a.length)];
    NSLog(@"ca - %@", ca);
    NSLog(@"ca p - %p", ca);
    NSLog(@"cca - %@", cca);
    NSLog(@"cca p - %p", cca);
    NSLog(@"mcca - %@", mcca);
    NSLog(@"mcca p - %p", mcca);
    NSLog(@"a - %@", a);
    NSLog(@"a p - %@", a);
    NSLog(@"d - %@", d);
    NSLog(@"d[p] - %p", d);
    NSLog(@"===============");
    [a appendString:@"world"];
    NSLog(@"ca - %@", ca);
    NSLog(@"ca p - %p", ca);
    NSLog(@"cca - %@", cca);
    NSLog(@"cca p - %p", cca);
    NSLog(@"mcca - %@", mcca);
    NSLog(@"mcca p - %p", mcca);
    NSLog(@"a - %@", a);
    NSLog(@"a p - %@", a);
    NSLog(@"d - %@", d);
    NSLog(@"d[p] - %p", d);
}

- (void)test3 {
    NSArray *a = @[@"1", @"2", @"3"];
    NSArray *b = [a copy];
    NSArray *c = [a mutableCopy];
    id d = a;
    NSLog(@"a - %@", a);
    NSLog(@"a[p] - %p", a);
    NSLog(@"b - %@", b);
    NSLog(@"b[p] - %p", b);
    NSLog(@"c - %@", c);
    NSLog(@"c[p] - %p", c);
    NSLog(@"d - %@", d);
    NSLog(@"d[p] - %p", d);
    
    a = @[@"4", @"5", @"6"];
    NSLog(@"a - %@", a);
    NSLog(@"a[p] - %p", a);
    NSLog(@"b - %@", b);
    NSLog(@"b[p] - %p", b);
    NSLog(@"c - %@", c);
    NSLog(@"c[p] - %p", c);
    NSLog(@"d - %@", d);
    NSLog(@"d[p] - %p", d);
}

- (void)test4 {
    NSMutableArray *a = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil];
    id b = [a copy];
    id c = [a mutableCopy];
    id d = a;
    NSLog(@"a - %@", a);
    NSLog(@"a[p] - %p", a);
    NSLog(@"b - %@", b);
    NSLog(@"b[p] - %p", b);
    NSLog(@"c - %@", c);
    NSLog(@"c[p] - %p", c);
    NSLog(@"d - %@", d);
    NSLog(@"d[p] - %p", d);
    
    [a replaceObjectAtIndex:1 withObject:@"100"];
    NSLog(@"a - %@", a);
    NSLog(@"a[p] - %p", a);
    NSLog(@"b - %@", b);
    NSLog(@"b[p] - %p", b);
    NSLog(@"c - %@", c);
    NSLog(@"c[p] - %p", c);
    NSLog(@"d - %@", d);
    NSLog(@"d[p] - %p", d);
}

- (void)test5 {
    
}

@end
