//
//  GalleryInteractor.swift
//  Gallery
//
//  Created by Kate Bekkerman on 17/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

final class GalleryInteractor {
    private enum Constants {
        static let imageErrorMessage = "Не удалось загрузить изображение"
    }

    var imageLoader: ImageLoader!
}

extension GalleryInteractor: GalleryInteractorInput {
    func fetchImage(to cell: GalleryCell, url: String) {
        imageLoader.fetchImage(urlString: url) { fetchedImage, error in
            cell.spinner.stopAnimating()

            guard let image = fetchedImage, error == nil else {
                cell.label.text = "⚠️ " + (error?.localizedDescription ?? Constants.imageErrorMessage)

                return
            }

            cell.galleryImageView.image = image
        }
    }
}
