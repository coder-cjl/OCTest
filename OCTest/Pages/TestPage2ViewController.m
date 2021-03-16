//
//  TestPage2ViewController.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/12/15.
//

#import "TestPage2ViewController.h"
#import <JXCategoryView/JXCategoryView.h>
#import <Masonry/Masonry.h>
#import "TableSectionHeaderFooterView.h"
#import "TestCateHeaderFooterView.h"
#import <JXPagingView/JXPagerView.h>
#import "TestPage1ViewController.h"
#import "TestDemoPage1ViewController.h"
#import "TestDemoPage2ViewController.h"
#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>
#import "FullScreenGestureScrollView.h"

@interface TestPage2ViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    JXCategoryViewDelegate,
    JXPagerViewDelegate,
    JXPagerMainTableViewGestureDelegate
>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) JXCategoryTitleView *navTitleView;
@property (nonatomic, strong) JXCategoryIndicatorLineView *navLineView;
@property (nonatomic, strong) UIView *sectionCategoryHeaderView;
@property (nonatomic, strong) JXPagerView *pagerView;
@end

@implementation TestPage2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.pagerView];
    self.navTitleView.listContainer = (id<JXCategoryViewListContainer>)self.pagerView.listContainerView;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.pagerView.frame = self.view.bounds;
}

- (UIView *)listView {
    return self.view;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = (self.navTitleView.selectedIndex == 0);
    self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = NO;
}

#pragma mark JXPagerMainTableViewGestureDelegate
- (BOOL)mainTableViewGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    //禁止categoryView左右滑动的时候，上下和左右都可以滚动
    if (otherGestureRecognizer == self.navTitleView.collectionView.panGestureRecognizer) {
        return NO;
    }
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
}

#pragma mark JXCategoryViewDelegate
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
}

#pragma mark JXPagerViewDelegate
- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
    return self.sectionCategoryHeaderView;
}

- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
    return 100;
}

- (NSUInteger)heightForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return 44;
}

- (UIView *)viewForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return self.navTitleView;
}

- (NSInteger)numberOfListsInPagerView:(JXPagerView *)pagerView {
    return self.navTitleView.titles.count;
}

- (id<JXPagerViewListViewDelegate>)pagerView:(JXPagerView *)pagerView initListAtIndex:(NSInteger)index {
    TestPage1ViewController *cl = [TestPage1ViewController new];
    return cl;
}

- (Class)scrollViewClassInlistContainerViewInPagerView:(JXPagerView *)pagerView {
    return [FullScreenGestureScrollView class];
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class) forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld - %ld", indexPath.section, indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TestCateHeaderFooterView *test = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(TestCateHeaderFooterView.class)];
    self.sectionCategoryHeaderView = test;
    if (self.navTitleView.superview == nil) {
        [test addSubview:self.navTitleView];
    }
    return test;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

#pragma mark set & get
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
////        [_tableView registerClass:TableSectionHeaderFooterView.class forHeaderFooterViewReuseIdentifier:NSStringFromClass(TableSectionHeaderFooterView.class)];
//        [_tableView registerClass:TestCateHeaderFooterView.class forHeaderFooterViewReuseIdentifier:NSStringFromClass(TestCateHeaderFooterView.class)];
    }
    return _tableView;
}

- (JXCategoryTitleView *)navTitleView {
    if (!_navTitleView) {
        _navTitleView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        _navTitleView.indicators = @[self.navLineView];
        _navTitleView.titles = @[@"1", @"2", @"3"];
        _navTitleView.delegate = self;
        _navTitleView.contentScrollViewClickTransitionAnimationEnabled = NO;
    }
    return _navTitleView;
}

- (JXCategoryIndicatorLineView *)navLineView {
    if (!_navLineView) {
        _navLineView = [JXCategoryIndicatorLineView new];
    }
    return _navLineView;
}

- (JXPagerView *)pagerView {
    if (!_pagerView) {
        _pagerView = [[JXPagerView alloc] initWithDelegate:self];
        _pagerView.mainTableView.gestureDelegate = self;
    }
    return _pagerView;
}

- (UIView *)sectionCategoryHeaderView {
    if (!_sectionCategoryHeaderView) {
        _sectionCategoryHeaderView = [UIView new];
        _sectionCategoryHeaderView.backgroundColor = [UIColor redColor];
    }
    return _sectionCategoryHeaderView;
}
@end
