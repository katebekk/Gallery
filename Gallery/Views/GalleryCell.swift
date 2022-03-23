//
//  ProfileCell.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 06.02.2022.
//

import UIKit

final class GalleryCell: UICollectionViewCell {
    private let contentViewCornerRadius: CGFloat = 4.0
    
    private let galleryImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var galleryItem: GalleryItem? {
        didSet {
            if let imageSourseUrl = galleryItem?.imageSourseUrl{
                ImageCache.publicCache.fetchImage(urlString: imageSourseUrl, imageView: galleryImageView)
            }
            else if let image = galleryItem?.imageName{
                galleryImageView.image = UIImage(named:image)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .gray
        contentView.layer.cornerRadius = contentViewCornerRadius
        contentView.addSubview(galleryImageView)
    }
    
    private func setupLayouts() {
        galleryImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            galleryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            galleryImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
}
