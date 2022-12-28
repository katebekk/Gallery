//
//  GALGalleryCollectionViewModel.h
//  Gallery
//
//  Created by bekkerman on 28.12.2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GALGalleryCellModel;
@protocol ImageLoader;

NS_SWIFT_NAME(GalleryCollectionViewModel)
@interface GALGalleryCollectionViewModel : NSObject <UICollectionViewDataSource>

@property (nonatomic, strong) id<ImageLoader> imageLoader;

- (void)configureWith:(NSArray<GALGalleryCellModel *> *)cellModels;

@end

NS_ASSUME_NONNULL_END
