//
//  TestPageBaseViewController.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/12/15.
//

#import "TestPageBaseViewController.h"
#import <JXCategoryView/JXCategoryView.h>
#import "TestPage1ViewController.h"
#import "TestPage2ViewController.h"
#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>

@interface TestPageBaseViewController ()<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView *categoryTitleView;
@property (nonatomic, strong) JXCategoryIndicatorLineView *lineView;
@property (nonatomic, strong) JXCategoryListContainerView *listContentView;
@property (nonatomic, strong) TestPage1ViewController *page1;
@property (nonatomic, strong) TestPage2ViewController *page2;
@property (nonatomic, copy) NSArray *vcArrays;
@property (nonatomic, strong) UIButton *searchButton;
@end

@implementation TestPageBaseViewController

- (NSArray *)vcArrays {
    if (!_vcArrays) {
        _vcArrays = @[self.page1, self.page2];
    }
    return _vcArrays;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationItem.titleView = self.categoryTitleView;
    [self.view addSubview:self.categoryTitleView];
    [self.view addSubview:self.listContentView];
    [self.view addSubview:self.searchButton];
    [self addChildViewController:self.page1];
    [self addChildViewController:self.page2];
    
//    [self.categoryTitleView selectItemAtIndex:0];
    [self categoryView:self.categoryTitleView didSelectedItemAtIndex:self.categoryTitleView.selectedIndex];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryTitleView.selectedIndex == 0);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.categoryTitleView.frame = CGRectMake(0, [UIApplication sharedApplication].keyWindow.safeAreaInsets.top, 150, 44);
    self.listContentView.frame = CGRectMake(0, [UIApplication sharedApplication].keyWindow.safeAreaInsets.top + 44, self.view.bounds.size.width, self.view.bounds.size.height);
    self.searchButton.frame = CGRectMake(self.view.bounds.size.width - 50, [UIApplication sharedApplication].keyWindow.safeAreaInsets.top, 30, 30);
}

#pragma mark JXCategoryViewDelegate
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"indx -- %ld", index);
    self.searchButton.hidden = (index == 0);
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didClickSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"indx -- %ld", index);
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"indx -- %ld", index);
}

#pragma mark JXCategoryListContainerViewDelegate
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.categoryTitleView.titles.count;
}

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    return self.vcArrays[index];
}

#pragma mark - JXPagerMainTableViewGestureDelegate

- (BOOL)mainTableViewGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([self checkIsNestContentScrollView:(UIScrollView *)gestureRecognizer.view] || [self checkIsNestContentScrollView:(UIScrollView *)otherGestureRecognizer.view]) {
        //如果交互的是嵌套的contentScrollView，证明在左右滑动，就不允许同时响应
        return NO;
    }
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
}

- (BOOL)checkIsNestContentScrollView:(UIScrollView *)scrollView {
//    for (PagingNestCategoryListViewController *list in self.pagerView.validListDict.allValues) {
//        if (list.contentScrollView == scrollView) {
//            return YES;
//        }
//    }
    return NO;
}

#pragma mark set & get
- (JXCategoryTitleView *)categoryTitleView {
    if (!_categoryTitleView) {
        _categoryTitleView = [[JXCategoryTitleView alloc] initWithFrame:CGRectZero];
        _categoryTitleView.backgroundColor = [UIColor orangeColor];
        _categoryTitleView.titles = @[@"处CP", @"聊天室"];
        _categoryTitleView.titleFont = [UIFont systemFontOfSize:18];
        _categoryTitleView.titleSelectedFont = [UIFont systemFontOfSize:22];
        _categoryTitleView.titleSelectedColor = [UIColor blueColor];
        _categoryTitleView.indicators = @[self.lineView];
        _categoryTitleView.listContainer = self.listContentView;
        _categoryTitleView.delegate = self;
    }
    return _categoryTitleView;
}

- (JXCategoryListContainerView *)listContentView {
    if (!_listContentView) {
        _listContentView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    }
    return _listContentView;
}

- (JXCategoryIndicatorLineView *)lineView {
    if (!_lineView) {
        _lineView = [[JXCategoryIndicatorLineView alloc] init];
        _lineView.indicatorColor = [UIColor blueColor];
        _lineView.indicatorWidth = 15;
        _lineView.lineStyle = JXCategoryIndicatorLineStyle_Lengthen;
    }
    return _lineView;
}

- (TestPage1ViewController *)page1 {
    if (!_page1) {
        _page1 = [TestPage1ViewController new];
    }
    return _page1;
}

- (TestPage2ViewController *)page2 {
    if (!_page2) {
        _page2 = [TestPage2ViewController new];
    }
    return _page2;
}

- (UIButton *)searchButton {
    if (!_searchButton) {
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _searchButton.backgroundColor = [UIColor redColor];
    }
    return _searchButton;
}
@end
