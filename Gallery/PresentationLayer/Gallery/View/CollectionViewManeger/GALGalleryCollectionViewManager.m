//
//  GALGalleryCollectionViewManager.m
//  Gallery
//
//  Created by bekkerman on 12.01.2023.
//

#import <Foundation/Foundation.h>

#import "GALGalleryCollectionViewModel.h"

#import "Gallery-Swift.h"

@interface GALGalleryCollectionViewManager ()

@property (nonatomic) NSMutableArray<GALGalleryCellModel *> *cellModels;

@end

static const NSTimeInterval kAnimationDuration = 1.0;
static const CGFloat kSpacing = 10.0;
static const CGFloat kHighlightedItemOpacity = 0.9;

@implementation GALGalleryCollectionViewManager

- (void)reloadWith:(NSArray<GALGalleryCellModel *> *)cellModels {
    _cellModels = [cellModels mutableCopy];
    [self.collectionViewModel configureWith:cellModels];
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    GALGalleryCell *cell = (GALGalleryCell *)[collectionView cellForItemAtIndexPath:indexPath];

    [self deleteCell:cell indexPath:indexPath collectionView:collectionView];
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    if (cell != nil) {
        [cell.contentView.layer setOpacity:kHighlightedItemOpacity];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    if (cell != nil) {
        [cell.contentView.layer setOpacity:1.0];
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = UIScreen.mainScreen.bounds.size.width - 2 * kSpacing;
    
    return CGSizeMake(width, width);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(kSpacing, kSpacing, kSpacing, kSpacing);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return kSpacing;
}

#pragma mark - Private

- (void)deleteCell:(GALGalleryCell *)cell indexPath:(NSIndexPath *)indexPath collectionView:(UICollectionView *)collectionView {
    [collectionView setUserInteractionEnabled:NO];
    [UIView animateWithDuration:kAnimationDuration animations:^{
        CGFloat newCellXCoordinate = cell.frame.origin.x + cell.frame.size.width + kSpacing;
        cell.frame = CGRectMake(newCellXCoordinate,
                                cell.frame.origin.y,
                                cell.frame.size.width,
                                cell.frame.size.height);
        
        cell.layer.opacity = 0;
    }];
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kAnimationDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }

        [strongSelf.cellModels removeObjectAtIndex:indexPath.row];
        [strongSelf reloadWith:strongSelf.cellModels];
        [collectionView deleteItemsAtIndexPaths:@[indexPath]];
        [collectionView setUserInteractionEnabled:YES];
    });
}

@end
