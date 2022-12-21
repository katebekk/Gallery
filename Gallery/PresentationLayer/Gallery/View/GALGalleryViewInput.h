//
//  GALGalleryViewInput.h
//  Gallery
//
//  Created by bekkerman on 04.10.2022.
//

#import <UIKit/UIKit.h>

@class GALGalleryCellModel;

NS_SWIFT_NAME(GalleryViewInput)
@protocol GALGalleryViewInput <NSObject>

- (void)configureView;
- (void)configure:(NSArray<GALGalleryCellModel *> *)cellModels title:(NSString *)title;
- (void)refreshWithDelay;

@end
