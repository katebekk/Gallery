//
//  GALGalleryViewController.m
//  Gallery
//
//  Created by bekkerman on 30.09.2022.
//

#import <UIKit/UIKit.h>
#import <PureLayout/PureLayout.h>

#import "GALGalleryViewController.h"

#import "Gallery-Swift.h"

static double const kGalleryViewRefreshDelay = 1.0;

@interface GALGalleryViewController ()

@property (nonatomic) NSArray<GalleryCellModel *> *cellModels;
@property (nonatomic) NSString *pageTitle;

@property (nonatomic) UIRefreshControl *refresh;
@property (nonatomic) UICollectionView *collectionView;

@end

@implementation GALGalleryViewController

#pragma mark - Initialization

- (instancetype)init {
    if (self = [super init]) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.alwaysBounceVertical = YES;

        _refresh = [UIRefreshControl new];
    }

    return self;
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.output viewDidLoad];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.collectionView.collectionViewLayout invalidateLayout];
}

- (void)willTransition:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        [self.collectionView.collectionViewLayout invalidateLayout];
    }];
}

#pragma mark - GAGalleryViewInput

- (void)configureView {
    [self setupViews];
    [self setupActions];
    [self setupCollectionView];
    [self setupConstraints];
}

- (void)configure:(NSArray<GalleryCellModel *> *)cellModels title:(NSString *)title {
    self.pageTitle = title;
    self.cellModels = cellModels;
}

- (void)refreshWithDelay {
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kGalleryViewRefreshDelay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;

        [strongSelf.collectionViewManager reloadWith:strongSelf.cellModels];
        [strongSelf.collectionView reloadSections:[[NSIndexSet alloc] initWithIndex:0]];

        [strongSelf.refresh endRefreshing];
    });
}

#pragma mark - Private

- (void)setupViews {
    self.title = self.pageTitle;
    [self.view addSubview:self.collectionView];
}

- (void)setupActions {
    [self.refresh addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventAllEvents];
}

- (void)setupCollectionView {
    [self.collectionViewManager reloadWith:self.cellModels];

    self.collectionView.dataSource = self.collectionViewManager.collectionViewModel;
    self.collectionView.delegate = self.collectionViewManager;

    [self.collectionView registerClass:GALGalleryCell.self
            forCellWithReuseIdentifier:kGalleryCollectionViewCellIdentifier];

    self.collectionView.refreshControl = self.refresh;
}

- (void)setupConstraints {
    [self.collectionView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
    [self.collectionView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
}

#pragma mark - Actions

- (void)handleRefresh:(UIRefreshControl *)sender  {
    [self.output onRefreshWith:self.cellModels];
}

@end
