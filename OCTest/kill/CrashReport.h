//
//  CrashReport.h
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/27.
//

#ifndef CrashReport_h
#define CrashReport_h
#import <Foundation/Foundation.h>

#endif /* CrashReport_h */

static int sy_falat_signals[] = {
    SIGABRT,
    SIGBUS,
    SIGFPE,
    SIGILL,
    SIGSEGV,
    SIGTRAP,
    SIGTERM,
    SIGKILL,
};

static int sy_falat_signal_num = sizeof(sy_falat_signals) / sizeof(sy_falat_signals[0]);

void UncaughtExceptionHandler(NSException *exception) {
    NSArray *exceptions = [exception callStackSymbols];
    NSString *reason = exception.reason;
    NSString *name = exception.name;
    NSLog(@"\n");
    NSLog(@"[name] -- %@", name);
    NSLog(@"[reason] -- %@", reason);
    NSLog(@"[exceptions] -- %@", exceptions);
    NSLog(@"\n");
}

void SignalHandler(int code) {
    NSLog(@"code -- %d", code);
}

void InitCarshReport() {
    for (int i = 0; i < sy_falat_signal_num; i++) {
        signal(sy_falat_signals[i], SignalHandler);
    }
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
}


