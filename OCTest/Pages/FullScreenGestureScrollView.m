//
//  FullScreenGestureScrollView.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/12/16.
//

#import "FullScreenGestureScrollView.h"

@implementation FullScreenGestureScrollView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (self.contentOffset.x <= 0) {
        if ([otherGestureRecognizer.delegate isKindOfClass:NSClassFromString(@"_FDFullscreenPopGestureRecognizerDelegate")]) {
            return YES;
        }
    }
    return NO;
}


@end
