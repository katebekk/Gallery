//
//  GALGalleryViewController.h
//  Gallery
//
//  Created by bekkerman on 30.09.2022.
//

#import <UIKit/UIKit.h>

#import "GALGalleryViewInput.h"

@protocol GALGalleryViewOutput;
@protocol GALGalleryModule;
@class GALGalleryCollectionViewManager;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(GalleryViewController)
@interface GALGalleryViewController : UIViewController <GALGalleryViewInput>

@property (nonatomic, strong) id<GALGalleryViewOutput> output;
@property (nonatomic, strong) id<GALGalleryModule> galleryModule;
@property (nonatomic, strong) GALGalleryCollectionViewManager *collectionViewManager;

@end

NS_ASSUME_NONNULL_END
