//
//  ProfileCell.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 06.02.2022.
//

import UIKit

final class GalleryCell: UICollectionViewCell {
    private enum Constants {
        static let contentViewCornerRadius: CGFloat = 4.0
    }

    private let galleryImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }

    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = Constants.contentViewCornerRadius
        contentView.backgroundColor = .white

        contentView.addSubview(galleryImageView)
    }
    
    private func setupLayouts() {
        galleryImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            galleryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            galleryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            galleryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with imageName: String) {
        galleryImageView.image = UIImage(named: imageName)
        print("setup cell \(imageName)")
    }

}
