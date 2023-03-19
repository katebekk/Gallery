//
//  GALImageLoader.h
//  Gallery
//
//  Created by Ekaterina Bekkerman on 19.03.2023.
//

#import <UIKit/UIKit.h>
#import "GALImageLoaderCacheMode.h"
#import "GALImageLoader.h"

NS_SWIFT_NAME(ImageLoader)
@protocol GALImageLoader <NSObject>

- (void)fetchImageWithURL:(NSString *_Nonnull)urlString
                cacheMode:(GALImageLoaderCacheMode)cacheMode
        completionHandler:(void (^_Nonnull)(UIImage * _Nullable, NSError *_Nullable error))completionHandler;
- (void)clearCache;

@end
