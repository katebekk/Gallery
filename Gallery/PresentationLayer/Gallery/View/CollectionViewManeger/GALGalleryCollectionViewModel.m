//
//  GALGalleryCollectionViewModel.m
//  Gallery
//
//  Created by bekkerman on 28.12.2022.
//

#import "GALGalleryCollectionViewModel.h"
#import "GALGalleryCollectionViewConstsnts.h"

#import "Gallery-Swift.h"

@interface GALGalleryCollectionViewModel ()

@property (nonatomic) NSArray<GALGalleryCellModel *> *cellModels;

@end

@implementation GALGalleryCollectionViewModel

- (void)configureWith:(NSArray<GALGalleryCellModel *> *)cellModels {
    _cellModels = cellModels;
}

#pragma mark - UICollectionViewDataSource

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    GALGalleryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:GALGalleryCollectionViewCellIdentifier forIndexPath:indexPath];

    NSString *urlString = [self.cellModels objectAtIndex:indexPath.row].urlString;
    [self.imageLoader fetchImageWithURL:urlString cacheMode:GALImageLoaderCacheModeDefault completionHandler:^(UIImage * _Nullable fetchedImage, NSError * _Nullable error) {

        [cell configureWith:fetchedImage error:error];
    }];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.cellModels.count;
}

@end
