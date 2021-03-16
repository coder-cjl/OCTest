//
//  UIColor+SYColor.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/26.
//

#import "UIColor+SYColor.h"
#import "UIColor+SYHex.h"

@implementation UIColor (SYColor)

+ (UIColor *)sy_color_E43314 {
    return [self sy_hex:@"E43314"];
}

+ (UIColor *)sy_color_FFFFFF {
    return [self sy_hex:@"FFFFFF"];
}

+ (UIColor *)sy_color_000000 {
    return [self sy_hex:@"000000"];
}

+ (UIColor *)sy_color_123456 {
    return [self sy_hex:@"123456" alpha:1.0];
}

+ (UIColor *)sy_color_FA4F84 {
    return [self sy_hex:@"FA4F84"];
}

@end
