//
//  GALGalleryPresenter.h
//  Gallery
//
//  Created by bekkerman on 22.12.2022.
//

#import <Foundation/Foundation.h>

#import "GALGalleryViewOutput.h"
#import "GALGalleryModule.h"

@protocol GALGalleryViewInput;
@protocol GALGalleryModuleOutput;
@class GalleryStateStorage;

NS_SWIFT_NAME(GalleryPresenter)
@interface GALGalleryPresenter : NSObject <GALGalleryViewOutput, GALGalleryModule>

@property (nonatomic) GalleryStateStorage *stateStorage;

@property (nonatomic, weak) id<GALGalleryViewInput> view;
@property (nonatomic, weak) id<GALGalleryModuleOutput> moduleOutput;

@end
