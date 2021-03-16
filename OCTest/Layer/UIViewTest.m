//
//  UIViewTest.m
//  OCTest
//
//  Created by 陈建蕾 on 2021/3/12.
//

#import "UIViewTest.h"

@interface UIViewTest ()
@property (nonatomic, strong) UIView *testA;
@end

@implementation UIViewTest

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)test1 {
    [self addSubview:self.testA];
    /** 强制刷新 */
    [self.testA layoutIfNeeded];
    
    /** 重绘 drawRect */
    [self.testA setNeedsDisplay];
    
    /** 需要更新约束， 然后调用 layoutIfNeeded */
    [self.testA updateConstraintsIfNeeded];
}

- (UIView *)testA {
    if (!_testA) {
        _testA = [UIView new];
    }
    return _testA;
}
@end
