//
//  KillTest.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/27.
//

#import "KillTest.h"
#import <CrashReporter/CrashReporter.h>

@implementation KillTest

+ (void)sy_application_stack_info {
    PLCrashReporterConfig *config = [[PLCrashReporterConfig alloc] initWithSignalHandlerType:PLCrashReporterSignalHandlerTypeBSD symbolicationStrategy:PLCrashReporterSymbolicationStrategyAll];
    NSData *data = [[[PLCrashReporter alloc] initWithConfiguration:config] generateLiveReport];
    NSError *error;
    PLCrashReport *report = [[PLCrashReport alloc] initWithData:data error:&error];
    if (error) {
        NSLog(@"%@", error.localizedDescription);
        return;;
    }
    NSString *info = [PLCrashReportTextFormatter stringValueForCrashReport:report withTextFormat:PLCrashReportTextFormatiOS];
    NSLog(@"%@", info);
}

- (void)test2 {
//    signal(CALLSTACK_SIG, nil);
}

@end
