//
//  GALGalleryPresenter.m
//  Gallery
//
//  Created by bekkerman on 22.12.2022.
//

#import "GALGalleryViewInput.h"
#import "GALGalleryPresenter.h"

@implementation GALGalleryPresenter

@synthesize moduleOutput;

#pragma mark - GalleryViewOutput

- (void)viewDidLoad {
    if (self.view == nil) {
        return;
    }
    
    [self.view configureView];
}

- (void)onRefresh {
    if (self.view == nil) {
        return;
    }

    [self.view refreshWithDelay];
}

#pragma mark - GalleryModule

- (void)configure:(NSArray<GALGalleryCellModel *> * _Nonnull)cellModels title:(NSString * _Nonnull)title {
    if (self.view == nil) {
        return;
    }
    
    [self.view configure:cellModels title:title];
}

@end
