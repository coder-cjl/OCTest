//
//  AppStatusNextViewController.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/12/9.
//

#import "AppStatusNextViewController.h"
#import "SYAppStatusManager.h"

@interface AppStatusNextViewController ()
<
    SYAppStatusDelegate
>
@end

@implementation AppStatusNextViewController
#pragma mark SYAppStatusDelegate
- (void)sy_appStatus_didEnterBackground:(NSNotification *)notification {
    NSLog(@"AppStatusNextViewController");
    NSLog(@"%@", notification);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[SYAppStatusManager manager] regist:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
