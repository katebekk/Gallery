//
//  CollectionViewModel.swift
//  Gallery
//
//  Created by bekkerman on 27.06.2022.
//

import UIKit

class GalleryCollectionViewModel: NSObject {
    private enum Constants {
        static let cellIdentifier = "Cell"
    }

    private var items: [GalleryItem] = []

    // MARK: - LifeCycle
    func initWithArray(items: [GalleryItem]) {
        self.items = items
    }

    func updateWithArray(items: [GalleryItem]) {
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
        cell.setGalleryItem(galleryItem: items[indexPath.row])

        return cell
    }
}
