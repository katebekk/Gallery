//
//  GALGalleryCollectionViewModel.h
//  Gallery
//
//  Created by bekkerman on 28.12.2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GALGalleryCellModel;
@protocol GALImageLoader;

NS_SWIFT_NAME(GalleryCollectionViewModel)
@interface GALGalleryCollectionViewModel : NSObject <UICollectionViewDataSource>

@property (nonatomic) id<GALImageLoader> imageLoader;

- (void)configureWith:(NSArray<GALGalleryCellModel *> *)cellModels;

@end

NS_ASSUME_NONNULL_END
