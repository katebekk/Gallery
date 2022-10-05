//
//  CollectionViewModel.swift
//  Gallery
//
//  Created by bekkerman on 27.06.2022.
//

import UIKit

@objc final class GalleryCollectionViewModel: NSObject {
    private enum Constants {
        static let imageErrorMessage = "Не удалось загрузить изображение"
    }

    // MARK: - Properties
    var imageLoader: ImageLoader!

    private var cellModels: [GalleryCellModel] = []

    // MARK: - LifeCycle
    func configure(with cellModels: [GalleryCellModel]) {
        self.cellModels = cellModels
    }
}

// MARK: - UICollectionViewDataSource
extension GalleryCollectionViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCell.cellIdentifier, for: indexPath) as! GalleryCell

        imageLoader.fetchImage(urlString: cellModels[indexPath.row].urlString) { fetchedImage, error in
            cell.configure(with: fetchedImage, error: error)
        }

        return cell
    }
}
