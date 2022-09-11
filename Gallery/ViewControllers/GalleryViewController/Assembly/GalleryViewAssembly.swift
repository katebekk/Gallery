//
//  GalleryViewAssembler.swift
//  Gallery
//
//  Created by bekkerman on 01.08.2022.
//

import Foundation

final class GalleryViewAssembly {
    func viewController() -> GalleryViewController {
        let loader = ServiceAssembly.shared.imageLoader()
        let model = GalleryCollectionViewModel(loader: loader)
        let manager = GalleryCollectionViewManager(model: model)

        let viewController = GalleryViewController(сollectionViewManager: manager)

        return viewController
    }
}
