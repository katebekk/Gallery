//
//  GALGalleryViewOutput.h
//  Gallery
//
//  Created by bekkerman on 22.12.2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(GalleryViewOutput)
@protocol GALGalleryViewOutput <NSObject>

- (void)viewDidLoad;
- (void)onRefresh;

@end

NS_ASSUME_NONNULL_END
