//
//  GALGalleryCollectionViewManager.h
//  Gallery
//
//  Created by bekkerman on 12.01.2023.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GALGalleryCellModel;
@class GALGalleryCollectionViewModel;

NS_SWIFT_NAME(GalleryCollectionViewManager)
@interface GALGalleryCollectionViewManager : NSObject <UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic) GALGalleryCollectionViewModel *collectionViewModel;

- (void)reloadWith:(NSArray<GALGalleryCellModel *> *)cellModels;

@end

NS_ASSUME_NONNULL_END
