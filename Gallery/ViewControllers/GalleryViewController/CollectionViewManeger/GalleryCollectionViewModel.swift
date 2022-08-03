//
//  CollectionViewModel.swift
//  Gallery
//
//  Created by bekkerman on 27.06.2022.
//

import UIKit

final class GalleryCollectionViewModel: NSObject {
    private enum Constants {
        static let cellIdentifier = "Cell"
    }

    // MARK: - Properties
    private var loader: ImageLoader!

    private var items: [GalleryItem] = []

    // MARK: - LifeCycle
    init(loader: ImageLoader) {
        self.loader = loader
    }

    func updateItems(items: [GalleryItem]) {
        self.items = items
    }
}

// MARK: - UICollectionViewDataSource
extension GalleryCollectionViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as! GalleryCell

        cell.set(galleryItem: items[indexPath.row], loader: loader)

        return cell
    }
}
