//
//  ProfileCell.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 06.02.2022.
//

import UIKit

final class GalleryCell: UICollectionViewCell {
    private enum Constants {
        static let contentViewCornerRadius = 4.0
        static let backgroundColor: UIColor = .gray
    }

    // MARK: - Properties
    private let spiner = UIActivityIndicatorView()
    private var galleryItem: GalleryItem?

    private let galleryImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    // MARK: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GalleryCell {
    func setGalleryItem(galleryItem: GalleryItem) {
        if let imageSourseUrl = galleryItem.imageSourseUrl {
            ImageCacheService.shared.fetchImage(
                urlString: imageSourseUrl,
                setImageHandler: { [weak self] fetchedImage in
                    self?.galleryImageView.image = fetchedImage
                },
                stopSpinerHandler: { [weak self] in
                    self?.spiner.stopAnimating()
                })
        } else if let image = galleryItem.imageName {
            galleryImageView.image = UIImage(named: image)
            spiner.stopAnimating()
        }
    }
}

private extension GalleryCell {
    func setupViews() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = Constants.backgroundColor
        contentView.layer.cornerRadius = Constants.contentViewCornerRadius
        contentView.addSubview(spiner)
        contentView.addSubview(galleryImageView)
        spiner.startAnimating()
    }

    func setupLayouts() {
        spiner.translatesAutoresizingMaskIntoConstraints = false
        galleryImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            spiner.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            spiner.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            galleryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            galleryImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
