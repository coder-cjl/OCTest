//
//  main.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/26.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "CrashReport.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        InitCarshReport();
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
