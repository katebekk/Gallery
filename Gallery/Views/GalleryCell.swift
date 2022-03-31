//
//  ProfileCell.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 06.02.2022.
//

import UIKit

final class GalleryCell: UICollectionViewCell {
    // MARK: - Properties
    private let contentViewCornerRadius = 4.0
    private let spiner = UIActivityIndicatorView()
    
    private let galleryImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var galleryItem: GalleryItem? {
        didSet {
            spiner.startAnimating()
            if let imageSourseUrl = galleryItem?.imageSourseUrl {
                ImageCache.shared.fetchImage(urlString: imageSourseUrl, imageView: galleryImageView, spiner: spiner)
            }
            else if let image = galleryItem?.imageName {
                galleryImageView.image = UIImage(named: image)
                spiner.stopAnimating()
            }
        }
    }
    
    // MARK: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .gray
        contentView.layer.cornerRadius = contentViewCornerRadius
        contentView.addSubview(spiner)
        contentView.addSubview(galleryImageView)
    }
    
    private func setupLayouts() {
        spiner.translatesAutoresizingMaskIntoConstraints = false
        galleryImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            spiner.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            spiner.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        NSLayoutConstraint.activate([
            galleryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            galleryImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
}
