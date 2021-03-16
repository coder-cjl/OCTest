//
//  UIColor+SYHex.h
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (SYHex)

+ (UIColor *)sy_hex:(NSString *)hex;
+ (UIColor *)sy_hex:(NSString *)hex alpha:(CGFloat)alpha;
- (UIColor *)alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
