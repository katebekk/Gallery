//
//  GALGalleryCellModel.h
//  Gallery
//
//  Created by bekkerman on 21.12.2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(GalleryCellModel)
@interface GALGalleryCellModel : NSObject

@property (nonatomic) NSString *urlString;

- (instancetype)initWithUrlString:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
