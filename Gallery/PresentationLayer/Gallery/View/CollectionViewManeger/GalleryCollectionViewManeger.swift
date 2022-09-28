//
//  GalleryCollectionViewManeger.swift
//  Gallery
//
//  Created by bekkerman on 27.06.2022.
//

import UIKit

final class GalleryCollectionViewManeger: NSObject {
    private enum Constants {
        static let spacing = 10.0
        static let highlightedItemOpacity: Float = 0.9

        static let сellAnimationDuration = 1.0
    }

    // MARK: - Properties
    var collectionViewModel: GalleryCollectionViewModel!

    private var cellModels: [GalleryCellModel] = []
}

// MARK: - Public
extension GalleryCollectionViewManeger {
    func reload(with cellModels: [GalleryCellModel]) {
        self.cellModels = cellModels
        collectionViewModel.configure(with: cellModels)
    }
}

// MARK: - UICollectionViewDelegate
extension GalleryCollectionViewManeger: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? GalleryCell else {
            return
        }

        deleteCell(cell, indexPath: indexPath, collectionView: collectionView)
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
extension GalleryCollectionViewManeger: UICollectionViewDelegateFlowLayout {
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

// MARK: - Private
private extension GalleryCollectionViewManeger {
    func deleteCell(_ cell: GalleryCell, indexPath: IndexPath, collectionView: UICollectionView) {
        collectionView.isUserInteractionEnabled = false
        UIView.animate(withDuration: Constants.сellAnimationDuration, delay: 0) {
            cell.frame.origin.x += cell.frame.width + Constants.spacing
            cell.layer.opacity = 0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.сellAnimationDuration) { [weak self] in
            guard let self = self else { return }

            self.cellModels.remove(at: indexPath.row)
            self.reload(with: self.cellModels)
            collectionView.deleteItems(at: [indexPath])
            collectionView.isUserInteractionEnabled = true
        }
    }
}
