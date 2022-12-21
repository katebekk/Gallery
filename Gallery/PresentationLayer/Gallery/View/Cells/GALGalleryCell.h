//
//  GALGalleryCell.h
//  Gallery
//
//  Created by bekkerman on 21.12.2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString * const kGalleryCollectionViewCellIdentifier = @"galleryCollectionViewCellIdentifier";

NS_SWIFT_NAME(GalleryCell)
@interface GALGalleryCell : UICollectionViewCell

@property (nonatomic, readonly) UIActivityIndicatorView *spinner;

- (void)configureWith:(UIImage * _Nullable)image error:(NSError * _Nullable)error;

@end

NS_ASSUME_NONNULL_END
