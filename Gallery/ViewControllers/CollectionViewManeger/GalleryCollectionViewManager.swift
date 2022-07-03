//
//  CollectionViewManager.swift
//  Gallery
//
//  Created by bekkerman on 27.06.2022.
//

import UIKit

class GalleryCollectionViewManager: NSObject {
    private enum Constants {
        static let spacing = 10.0
        static let highlightedItemOpacity: Float = 0.9

        static let сellAnimationDuration = 1.0
    }

    let collectionViewModel: GalleryCollectionViewModel

    private let collectionView: UICollectionView
    private var items: [GalleryItem] = []

    // MARK: - LifeCycle
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        collectionViewModel = GalleryCollectionViewModel()
    }
}

// MARK: - Public
extension GalleryCollectionViewManager {
    func configure(items: [GalleryItem]) {
        self.items = items
        collectionViewModel.initWithArray(items: items)
    }

    func updateCollectionViewModelWithArray(items: [GalleryItem]) {
        self.items = items
        collectionViewModel.updateWithArray(items: items)
    }
}

// MARK: - UICollectionViewDelegate
extension GalleryCollectionViewManager: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let collectionViewCell = collectionView.cellForItem(at: indexPath) as? GalleryCell else {
            return
        }

        UIView.animate(withDuration: Constants.сellAnimationDuration, delay: 0) {
            collectionViewCell.frame.origin.x += collectionViewCell.frame.width + Constants.spacing
            collectionViewCell.layer.opacity = 0
        }

        collectionView.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.сellAnimationDuration) { [weak self] in
            guard let self = self else { return }

            self.items.remove(at: indexPath.row)
            self.updateCollectionViewModelWithArray(items: self.items)
            self.collectionView.deleteItems(at: [indexPath])
            self.collectionView.isUserInteractionEnabled = true
        }
    }

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.layer.opacity = Constants.highlightedItemOpacity
        }
    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.layer.opacity = 1
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension GalleryCollectionViewManager: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 2 * Constants.spacing

        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: Constants.spacing, left: Constants.spacing, bottom: Constants.spacing, right: Constants.spacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constants.spacing
    }
}
