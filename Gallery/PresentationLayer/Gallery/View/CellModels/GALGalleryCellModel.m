//
//  GALGalleryCellModel.m
//  Gallery
//
//  Created by bekkerman on 21.12.2022.
//

#import "GALGalleryCellModel.h"

@implementation GALGalleryCellModel

- (instancetype)initWithUrlString:(NSString *)urlString {
    if (self) {
        _urlString = urlString;
    }

    return self;
}

@end
