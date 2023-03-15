//
//  GALGalleryModule.h
//  Gallery
//
//  Created by bekkerman on 22.12.2022.
//

#import <Foundation/Foundation.h>

#import "GALGalleryModuleOutput.h"

NS_ASSUME_NONNULL_BEGIN

@class GALGalleryCellModel;

NS_SWIFT_NAME(GalleryModule)
@protocol GALGalleryModule <NSObject>

@property (nonatomic, weak) id<GALGalleryModuleOutput> moduleOutput;

- (void)configure:(NSArray<GALGalleryCellModel *> *)cellModels title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
