//
//  ViewController.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/11/26.
//

#import "ViewController.h"
#import "TestObj.h"
#import "UIColor+SYColor.h"
#import "UIColor+SYHex.h"
#import "SYAppDelegateEventManager.h"
#import "Module1.h"
#import <Foundation/Foundation.h>
#import "KillTest.h"
#import <AVKit/AVKit.h>
#import "MultP.h"
#import <QGVAPlayer/QGVAPlayer.h>
#import "SYAppStatusManager.h"
#import "AppStatusNextViewController.h"
#import "TestPageBaseViewController.h"
#import "TestDemoPageViewController.h"
#import "SYPageViewController.h"
#import "CopyTest.h"
#import "StaticTest.h"
#import "LoadClassA.h"
#import "LoadSubClassA.h"
#import "LoadClassA+Wrapper1.h"
#import "LoadClassA+Wrapper.h"
#import "TestLifeViewController.h"
#import "RuntimeTest.h"
#import "MemoryTest.h"

@interface ViewController ()<SYAppStatusDelegate>
@property (nonatomic, strong) NSArray <TestObj *>*objs;
@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[SYAppDelegateEventManager share] targetModuleCall:KSYApplicationDidLoadTargetModuleCallName arg:nil];
    
}

- (void)sy_appStatus_didEnterBackground:(NSNotification *)notification {
    NSLog(@"ViewController");
    NSLog(@"%@", notification);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Demo ~";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    self.view.backgroundColor = [UIColor sy_hex:@"F45678" alpha:1];
    [[SYAppStatusManager manager] regist:self];
//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
//    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
//    dispatch_source_set_event_handler(timer, ^{
//        [[SYAppDelegateEventManager share] targetModuleCall:SYApplicationTargetModule1Name arg:@{@"name": @"sy"}];
//    });
//    dispatch_resume(timer);
}

- (NSArray *)objs {
    if (!_objs) {
        _objs = @[
            [[TestObj alloc] initWithName:@"Memory" action:TestActionMemory],
            [[TestObj alloc] initWithName:@"runTime" action:TestActionRunTime],
            [[TestObj alloc] initWithName:@"life" action:TestActionLife],
            [[TestObj alloc] initWithName:@"load" action:TestActionLoad],
            [[TestObj alloc] initWithName:@"static" action:TestActionStatic],
            [[TestObj alloc] initWithName:@"copy" action:TestActionCopy],
            [[TestObj alloc] initWithName:@"pages3" action:TestActionPages3],
            [[TestObj alloc] initWithName:@"pages2" action:TestActionPages2],
            [[TestObj alloc] initWithName:@"pages" action:TestActionPages],
            [[TestObj alloc] initWithName:@"app_status" action:TestActionAppStatus],
            [[TestObj alloc] initWithName:@"mp4" action:TestActionMP4],
            [[TestObj alloc] initWithName:@"mult" action:TestActionMult],
            [[TestObj alloc] initWithName:@"play" action:TestActionPlay],
            [[TestObj alloc] initWithName:@"date" action:TestActionDate],
            [[TestObj alloc] initWithName:@"stack_info" action:TestActionStackInfo],
            [[TestObj alloc] initWithName:@"kill" action:TestActionKill],
            [[TestObj alloc] initWithName:@"target" action:TestActionTarget],
            [[TestObj alloc] initWithName:@"color" action:TestActionColor],
            [[TestObj alloc] initWithName:@"none" action:TestActionNone],
            [[TestObj alloc] initWithName:@"first" action:TestActionFirtst],
        ];
    }
    return _objs;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (self.objs[indexPath.row].action) {
        case TestActionMemory: {
            [MemoryTest new];
        } break;
        case TestActionRunTime: {
            [RuntimeTest testRun2];
//            RuntimeTest *test = [RuntimeTest new];
//            [test testRun];
        } break;
        case TestActionLife: {
            TestLifeViewController *vc = [TestLifeViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        } break;
        case TestActionLoad: {
//            LoadSubClassA *test = [LoadSubClassA new];
//            [test testA];
            [LoadClassA testB];
        } break;
        case TestActionStatic: {
            StaticTest *test = [StaticTest new];
            test.name = @"aaa";
        } break;
        case TestActionCopy: {
            CopyTest *test = [CopyTest new];
            NSLog(@"%@", test);
        } break;
        case TestActionPages3: {
            [self.navigationController pushViewController:[SYPageViewController new] animated:YES];
        } break;
        case TestActionPages2: {
            [self.navigationController pushViewController:[TestDemoPageViewController new] animated:YES];
        } break;
        case TestActionPages: {
            [self.navigationController pushViewController:[TestPageBaseViewController new] animated:YES];
        } break;
        case TestActionAppStatus: {
            AppStatusNextViewController *vc = [AppStatusNextViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        } break;
        case TestActionMP4: {
//            UIView *playView = [[UIView alloc] initWithFrame:self.view.bounds];
//            NSString *path = [[NSBundle mainBundle] pathForResource:@"wheel" ofType:@"mp4"];
//            [self.view addSubview:playView];
////            playView.hwd_currentFrame
//            playView.hwd_renderByOpenGL = true;
//            [playView playHWDMP4:path repeatCount:-1 delegate:nil];
            int a = 24;
            int b = 124;
            CGFloat c = (CGFloat)a / (CGFloat)b;
            NSLog(@"%f", c);
        } break;
        case TestActionMult: {
            [MultP testObjects:@"aa", @"b", @"c", nil];
        } break;
        case TestActionPlay: {
            NSURL *url = [NSURL URLWithString:@"http://res.yingtaoclub.net/ost/user/10040/dynamics/79545891.mp4"];
            AVPlayerViewController *ctrl = [[AVPlayerViewController alloc] init];
            ctrl.player = [[AVPlayer alloc] initWithURL:url];
            [ctrl.player play];
            [self presentViewController:ctrl animated:YES completion:nil];
        } break;
        case TestActionDate: {
            UIDatePicker *picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
            picker.backgroundColor = [UIColor redColor];
            [self.view addSubview:picker];
//            [[UIApplication sharedApplication].delegate.window addSubview:picker];
        } break;
        case TestActionStackInfo: {
            [KillTest sy_application_stack_info];
        } break;
        case TestActionKill: {
            self.objs[100];
        } break;
        case TestActionTarget:
            [[SYAppDelegateEventManager share] targetModuleCall:KSYApplicationDidLoadTargetModuleCallName arg:@{@"name": @"sy"}];
//            [[SYAppDelegateEventManager share] targetModuleCall:SYApplicationTargetModule1Name arg:@{@"name": @"sy"}];
            break;
        case TestActionColor:
//            self.view.backgroundColor = [UIColor sy_color_FFFFFF];
            self.view.backgroundColor = [self.view.backgroundColor alpha:0.5];
            break;
        case TestActionNone:
            NSLog(@"none");
            // -1
            // 100 001
            // 101 000
            NSLog(@"%d", -5 >> 3);
//            NSLog(@"%d", -1 << 3);
            break;
        case TestActionFirtst:
            NSLog(@"first");
            break;
        default:
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class) forIndexPath:indexPath];
    cell.textLabel.text = self.objs[indexPath.row].name;
    return cell;
}


@end
