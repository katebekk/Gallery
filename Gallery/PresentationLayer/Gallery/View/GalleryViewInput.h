//
//  GalleryViewInput.h
//  Gallery
//
//  Created by bekkerman on 04.10.2022.
//

#import <UIKit/UIKit.h>

@class GalleryCellModel;

@protocol GalleryViewInput <NSObject>

- (void)configureView;
- (void)configure:(NSArray<GalleryCellModel *> *)cellModels title:(NSString *)title;
- (void)refreshWithDelay;

@end
