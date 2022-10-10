//
//  GalleryViewController.h
//  Gallery
//
//  Created by bekkerman on 30.09.2022.
//

#import <UIKit/UIKit.h>
#import "GalleryViewInput.h"

@protocol GalleryViewOutput;
@protocol GalleryModule;
@class GalleryCollectionViewManager;
@class GalleryCellModel;

@interface GalleryViewController : UIViewController <GalleryViewInput>

@property (nonatomic) id<GalleryViewOutput> output;
@property (nonatomic, weak) id<GalleryModule> module;
@property (nonatomic) GalleryCollectionViewManager *collectionViewManager;

@end
