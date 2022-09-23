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
    var interactor: GalleryInteractor!

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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath) as! GalleryCell

//        во вью не место интерактору
//        interactor.fetchImage(to: cell, url: cellModels[indexPath.row].urlString)

        return cell
    }
}
