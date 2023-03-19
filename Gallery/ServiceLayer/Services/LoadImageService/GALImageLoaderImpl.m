//
//  GALImageLoaderImpl.m
//  Gallery
//
//  Created by Ekaterina Bekkerman on 15.03.2023.
//

#import <Foundation/Foundation.h>
#import "GALImageLoaderImpl.h"

@interface GALImageLoaderImpl ()

@property (nonatomic) NSCache<NSString *, UIImage*> *cachedImages;

@end

@implementation GALImageLoaderImpl

- (instancetype)init {
  self = [super init];
  if (self != nil) {
      _cachedImages = [[NSCache alloc] init];
  }
  return self;
}

+ (instancetype)shared {
    static id shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [self new];
    });

    return shared;
}

#pragma mark -
- (void)fetchImageWithURL:(NSString *)urlString
                cacheMode:(GALImageLoaderCacheMode)cacheMode
        completionHandler:(void (^)(UIImage * _Nullable, NSError *_Nullable error))completionHandler {
    UIImage *cachedImage = [self getImageFromCache:urlString];
    if (cachedImage != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(cachedImage, nil);
        });
        
        return;
    }
    
    if (cacheMode == GALImageLoaderCacheModeCacheOnly) { return; }
    
    NSURL *URL = [[NSURL alloc] initWithString:urlString];

    if (URL == nil) { return; }
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *task = [session dataTaskWithURL:URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data == nil && error != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            return;
        }
        
        UIImage *image = [[UIImage alloc] initWithData:data];
        if (image != nil) {
            [weakSelf.cachedImages setObject:image forKey:urlString];
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(image, nil);
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, nil);
            });
        }
    }];

    [task resume];
}

- (void)clearCache {
    [self.cachedImages removeAllObjects];
}

#pragma mark - Private

- (UIImage * __nullable)getImageFromCache:(NSString *)url {
    return [self.cachedImages objectForKey:url];
}

@end
