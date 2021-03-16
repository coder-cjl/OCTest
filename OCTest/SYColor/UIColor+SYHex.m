//
//  UIColor+SYHex.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/26.
//

#import "UIColor+SYHex.h"

@implementation UIColor (SYHex)

+ (UIColor *)sy_hex:(NSString *)hex {
    return [self sy_hex:hex alpha:1.0];
}

+ (UIColor *)sy_hex:(NSString *)hex alpha:(CGFloat)alpha {
    if (hex.length == 0 || hex.length < 6) { return [UIColor blackColor]; }
    NSScanner *scanner = [NSScanner scannerWithString:hex];
    unsigned hexInt;
    if (![scanner scanHexInt:&hexInt]) {
        return [UIColor blackColor];
    }
    return [self _sy_color_rgbHex:hexInt alpha:alpha];
}

- (UIColor *)alpha:(CGFloat)alpha {
    return [self colorWithAlphaComponent:alpha];
}

+ (UIColor *)_sy_color_rgbHex:(UInt32)hex alpha:(CGFloat)alpha {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = hex & 0xFF;
    return [self colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:alpha];
}

@end
