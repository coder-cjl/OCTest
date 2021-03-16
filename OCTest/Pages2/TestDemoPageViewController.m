//
//  TestDemoPageViewController.m
//  OCTest
//
//  Created by 陈建蕾 on 2020/12/15.
//

#import "TestDemoPageViewController.h"
#import <JXCategoryView/JXCategoryView.h>
#import "TestPage1ViewController.h"
#import "TestDemoPage1ViewController.h"
#import "TestPage2ViewController.h"
#import <Masonry/Masonry.h>

@interface TestDemoPageViewController ()
<
    JXCategoryListContainerViewDelegate,
    JXCategoryViewDelegate,
    JXCategoryCollectionViewGestureDelegate
>
@property (nonatomic, strong) JXCategoryTitleView *titleView;
@property (nonatomic, strong) JXCategoryIndicatorLineView *lineView;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;
@property (nonatomic, strong) NSArray *vcArrays;
@property (nonatomic, strong) TestPage1ViewController *page1;
@property (nonatomic, strong) TestDemoPage1ViewController *page2;
@property (nonatomic, strong) TestPage2ViewController *page3;
@end

@implementation TestDemoPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.listContainerView];
    [self addChildViewController:self.page1];
    [self addChildViewController:self.page2];
    [self addChildViewController:self.page3];
    [self categoryView:self.titleView didSelectedItemAtIndex:self.titleView.selectedIndex];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.top.mas_equalTo(self.view.safeAreaInsets.top);
        } else {
            // Fallback on earlier versions
        }
        make.height.mas_equalTo(44);
    }];
    
    [self.listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.titleView.mas_bottom);
    }];
//    self.titleView.frame = CGRectMake(0, [UIApplication sharedApplication].keyWindow.safeAreaInsets.top + 44, [UIScreen mainScreen].bounds.size.width, 44);
//    self.listContainerView.frame = CGRectMake(0, [UIApplication sharedApplication].keyWindow.safeAreaInsets.top + 44 + 44, self.view.bounds.size.width, self.view.bounds.size.height);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = (self.titleView.selectedIndex == 0);
}

#pragma mark JXCategoryListContainerViewDelegate
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titleView.titles.count;
}

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    return self.vcArrays[index];
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
}

#pragma mark JXCategoryCollectionViewGestureDelegate
- (BOOL)categoryCollectionView:(JXCategoryCollectionView *)collectionView gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (collectionView.contentOffset.x <= 0) {
        if ([otherGestureRecognizer.delegate isKindOfClass:NSClassFromString(@"_FDFullscreenPopGestureRecognizerDelegate")]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark set & get
- (JXCategoryTitleView *)titleView {
    if (!_titleView) {
        _titleView = [[JXCategoryTitleView alloc] initWithFrame:CGRectZero];
        _titleView.titles = @[@"最新", @"热门", @"关注"];
        _titleView.indicators = @[self.lineView];
        _titleView.listContainer = self.listContainerView;
        _titleView.titleColor = [UIColor yellowColor];
        _titleView.titleSelectedColor = [UIColor blackColor];
        _titleView.backgroundColor = [UIColor redColor];
        _titleView.delegate = self;
        _titleView.averageCellSpacingEnabled = NO;
        _titleView.cellSpacing = 30;
        _titleView.cellWidth = JXCategoryViewAutomaticDimension;
        _titleView.collectionView.gestureDelegate = self;
    }
    return _titleView;
}

- (JXCategoryListContainerView *)listContainerView {
    if (!_listContainerView) {
        _listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    }
    return _listContainerView;
}

- (JXCategoryIndicatorLineView *)lineView {
    if (!_lineView) {
        _lineView = [[JXCategoryIndicatorLineView alloc] initWithFrame:CGRectZero];
        _lineView.indicatorColor = [UIColor blueColor];
//        _lineView.indicatorWidth = 15;
//        _lineView.lineStyle = JXCategoryIndicatorLineStyle_Lengthen;
        _lineView.indicatorHeight = 10;
        _lineView.verticalMargin = 14;
    }
    return _lineView;
}

- (TestPage1ViewController *)page1 {
    if (!_page1) {
        _page1 = [TestPage1ViewController new];
    }
    return _page1;
}

- (TestDemoPage1ViewController *)page2 {
    if (!_page2) {
        _page2 = [TestDemoPage1ViewController new];
    }
    return _page2;
}

- (TestPage2ViewController *)page3 {
    if (!_page3) {
        _page3 = [TestPage2ViewController new];
    }
    return _page3;
}

- (NSArray *)vcArrays {
    if (!_vcArrays) {
        _vcArrays = @[self.page1, self.page2, self.page3];
    }
    return _vcArrays;
}

@end
