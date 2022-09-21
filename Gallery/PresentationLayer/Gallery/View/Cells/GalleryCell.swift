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
        static let textLinesNumber = 5
        static let textSpacing = -10.0

        static let imageErrorMessage = "Не удалось загрузить изображение"
    }

    // MARK: - Properties
    let spinner = UIActivityIndicatorView()
    private var galleryItem: GalleryCellModel?

    let label: UILabel = {
        let label = UILabel()
        label.textColor = .systemYellow

        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = Constants.textLinesNumber

        return label
    }()
    let galleryImageView: UIImageView = {
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
    func configure(with cellModel: GalleryCellModel, loader: ImageLoader) {
        loader.fetchImage(urlString: cellModel.urlString) { [weak self] fetchedImage, error in
            self?.spinner.stopAnimating()

            guard let image = fetchedImage, error == nil else {
                self?.label.text = "⚠️ " + (error?.localizedDescription ?? Constants.imageErrorMessage)

                return
            }

            self?.galleryImageView.image = image
        }
    }
}

private extension GalleryCell {
    func setupViews() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = Constants.backgroundColor
        contentView.layer.cornerRadius = Constants.contentViewCornerRadius
        contentView.addSubview(spinner)
        contentView.addSubview(label)
        contentView.addSubview(galleryImageView)

        spinner.startAnimating()
    }

    func setupLayouts() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        galleryImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            spinner.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            spinner.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: Constants.textSpacing)
        ])
        NSLayoutConstraint.activate([
            galleryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            galleryImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}