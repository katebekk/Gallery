//
//  GALGalleryCell.m
//  Gallery
//
//  Created by bekkerman on 21.12.2022.
//

#import <UIKit/UIKit.h>
#import <PureLayout/PureLayout.h>

#import "GALGalleryCell.h"
#import "GALGalleryCollectionViewConstsnts.h"

#import "Gallery-Swift.h"

@interface GALGalleryCell ()

@property (nonatomic) UILabel *label;
@property (nonatomic) UIImageView *galleryImageView;

@property (nonatomic) BOOL didSetupConstraints;

@end

@implementation GALGalleryCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];

        [self setNeedsUpdateConstraints];
    }

    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        [self.spinner autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.spinner autoAlignAxisToSuperviewAxis:ALAxisVertical];

        [self.label autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.label autoAlignAxisToSuperviewAxis:ALAxisVertical];

        [NSLayoutConstraint activateConstraints:@[
            [self.label.widthAnchor constraintEqualToAnchor:self.contentView.widthAnchor constant:GALGalleryCollectionViewLabelHorizontalMargin]
        ]];

        [self.galleryImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.galleryImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];

        self.didSetupConstraints = YES;
    }

    [super updateConstraints];
}

- (void)configureWith:(UIImage *)image error:(NSError *)error {
    [self.spinner stopAnimating];

    if (image != nil && error == nil) {
        self.galleryImageView.image = image;
    } else {
        NSMutableString *errorDescription = [NSMutableString new];
        [errorDescription appendString:@"⚠️ "];

        NSString *localizedDescription = [error localizedDescription];

        if (localizedDescription != nil) {
            [errorDescription appendString:localizedDescription];
        } else {
            [errorDescription appendString:GALGalleryCollectionViewImageErrorMessage];
        }

        self.label.text = errorDescription;
    }
}

#pragma mark - Private

- (void)setupViews {
    self.contentView.clipsToBounds = YES;
    self.contentView.backgroundColor = UIColor.grayColor;
    self.contentView.layer.cornerRadius = GALGalleryCollectionViewContentViewCornerRadius;

    _spinner = [UIActivityIndicatorView new];

    _label = [UILabel new];
    _label.textColor = UIColor.systemYellowColor;
    _label.textAlignment = NSTextAlignmentCenter;
    _label.lineBreakMode = NSLineBreakByWordWrapping;
    _label.numberOfLines = GALGalleryCollectionViewTextLinesNumber;

    _galleryImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _galleryImageView.contentMode = UIViewContentModeScaleAspectFill;
    _galleryImageView.clipsToBounds = YES;

    [self.contentView addSubview:self.spinner];
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.galleryImageView];

    [self.spinner startAnimating];
}

@end
