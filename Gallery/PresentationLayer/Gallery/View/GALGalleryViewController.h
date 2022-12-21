//
//  GALGalleryViewController.h
//  Gallery
//
//  Created by bekkerman on 30.09.2022.
//

#import <UIKit/UIKit.h>
#import "GALGalleryViewInput.h"

@protocol GalleryViewOutput;
@protocol GalleryModule;
@class GalleryCollectionViewManager;
@class GalleryCellModel;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(GalleryViewController)
@interface GALGalleryViewController : UIViewController <GALGalleryViewInput>

@property (nonatomic) id<GalleryViewOutput> output;
@property (nonatomic, weak) id<GalleryModule> module;
@property (nonatomic) GalleryCollectionViewManager *collectionViewManager;

@end

NS_ASSUME_NONNULL_END
