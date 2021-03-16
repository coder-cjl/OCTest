//
//  MultP.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/12/3.
//

#import "MultP.h"

@implementation MultP

+ (void)testObjects:(NSString *)object, ... {
    va_list args;
    va_start(args, object);
    while (va_arg(args, NSString *)) {
        NSString *obj = va_arg(args, NSString *);
        NSLog(@"%@", obj);
    }
    va_end(args);
}

@end
