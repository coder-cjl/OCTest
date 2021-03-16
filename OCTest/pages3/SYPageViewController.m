//
//  SYPageViewController.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/12/16.
//

#import "SYPageViewController.h"
#import <UINavigationController+FDFullscreenPopGesture.h>
#import <JXPagingView/JXPagerView.h>
#import <JXCategoryView/JXCategoryView.h>
#import "SYBase1ViewController.h"
#import "SYBase2ViewController.h"

@interface SYPageViewController ()
<
    JXCategoryViewDelegate,
    JXPagerViewDelegate,
    JXPagerMainTableViewGestureDelegate
>
@property (nonatomic, strong) JXPagerView *pageView;
@property (nonatomic, strong) JXCategoryTitleView *titleView;
@property (nonatomic, strong) UIView *headerView;
@end

@implementation SYPageViewController

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 0)];
        _headerView.backgroundColor = [UIColor redColor];
    }
    return _headerView;
}

- (JXPagerView *)pageView {
    if (!_pageView) {
        _pageView = [[JXPagerView alloc] initWithDelegate:self];
        _pageView.backgroundColor = [UIColor blueColor];
    }
    return _pageView;
}

- (JXCategoryTitleView *)titleView {
    if (!_titleView) {
        _titleView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 50)];
        _titleView.titles = @[@"处CP", @"聊天室"];
        _titleView.backgroundColor = [UIColor orangeColor];
        _titleView.delegate = self;
    }
    return _titleView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.fd_prefersNavigationBarHidden = YES;
    [self.view addSubview:self.pageView];
    self.pageView.frame = self.view.bounds;
    
    self.titleView.listContainer = (id<JXCategoryViewListContainer>)self.pageView.listContainerView;
}

- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
    return self.headerView;
}

- (UIView *)viewForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return self.titleView;
}

- (NSInteger)numberOfListsInPagerView:(JXPagerView *)pagerView {
    return self.titleView.titles.count;
}

- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
    return 0;
}

- (NSUInteger)heightForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return 50;
}

- (id<JXPagerViewListViewDelegate>)pagerView:(JXPagerView *)pagerView initListAtIndex:(NSInteger)index {
    return [SYBase1ViewController new];
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView *scrollView))callback {
    
}

//固定头部视图
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 40;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

@end
