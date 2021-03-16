//
//  SYMonitor.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/27.
//

#import "SYMonitor.h"
#import <CrashReporter/CrashReporter.h>
#import <UIKit/UIKit.h>

@interface SYMonitor ()
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, assign) NSTimeInterval lastTime;
@property (nonatomic, assign) NSInteger tryCount;
@property (nonatomic, copy) NSString *logInfo;
@end

@implementation SYMonitor {
    int timeoutCount;
    CFRunLoopObserverRef observer;
    dispatch_semaphore_t dispath_semahore;
    CFRunLoopActivity activity;
}

+ (instancetype)share {
    static SYMonitor *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [self new];
    });
    return manager;
}

- (void)begin {
    if (self->observer) { return; }
    self->dispath_semahore = dispatch_semaphore_create(0);
    CFRunLoopObserverContext context = {0, (__bridge void *)self, NULL, NULL};
    self->observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, &_runLoopObserverCall, &context);
    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    dispatch_queue_t queue = dispatch_queue_create("com.sy-monitor.www", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        while (YES) {
            long semaphoreWait = dispatch_semaphore_wait(self->dispath_semahore, dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_MSEC));
            if (semaphoreWait != 0) {
                if (!self->observer) {
                    self->timeoutCount = 0;
                    self->dispath_semahore = 0;
                    self->activity = 0;
                    return;
                }
                if (self->activity == kCFRunLoopBeforeSources || self->activity == kCFRunLoopAfterWaiting) {
                    if (++self->timeoutCount == 3) {
                        continue;
                    }
                    [self _sy_log_stack_info];
                }
            }
            self->timeoutCount = 0;
        }
    });
}

- (void)stop {
    if (!self->observer) { return; }
    CFRunLoopRemoveObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    CFRelease(self->observer);
    self->observer = NULL;
}

static void _runLoopObserverCall(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    SYMonitor *obj = (__bridge SYMonitor *)info;
    obj->activity = activity;
    dispatch_semaphore_t semaphore = obj->dispath_semahore;
    dispatch_semaphore_signal(semaphore);
}

- (void)_sy_log_stack_info {
    PLCrashReporterConfig *config = [[PLCrashReporterConfig alloc] initWithSignalHandlerType:PLCrashReporterSignalHandlerTypeBSD symbolicationStrategy:PLCrashReporterSymbolicationStrategyAll];
    NSData *data = [[[PLCrashReporter alloc] initWithConfiguration:config] generateLiveReport];
    NSError *error;
    PLCrashReport *report = [[PLCrashReport alloc] initWithData:data error:&error];
    if (error) {
        NSLog(@"%@", error.localizedDescription);
        return;
    }
    NSString *info = [PLCrashReportTextFormatter stringValueForCrashReport:report withTextFormat:PLCrashReportTextFormatiOS];
    if (![self.logInfo isEqualToString:info]) {
        self.logInfo = info;
        NSLog(@"------------\n%@\n------------", info);
    }
}

#pragma mark FPS
- (void)beginFPS {
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(onActionTick:)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)onActionTick:(CADisplayLink *)link {
    if (self.lastTime == 0) {
        self.lastTime = link.timestamp;
        return;
    }
    self.count ++;
    NSTimeInterval delta = link.timestamp - self.lastTime;
    if (delta < 1) { return; }
    self.lastTime = link.timestamp;
    float fps = self.count / delta;
    self.count = 0;
    NSLog(@"progress -- %f", fps);
    if (fps < 50.0) {
        NSLog(@"tryCount-- %ld", (long)self.tryCount);
        self.tryCount++;
        if (self.tryCount >= 3) {
            [self _sy_log_stack_info];
            self.tryCount = 0;
        }
    }
}

- (void)stopFPS {
    [_displayLink invalidate];
    _displayLink = nil;
}
@end
