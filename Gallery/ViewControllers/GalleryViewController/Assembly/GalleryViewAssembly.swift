//
//  GalleryViewAssembler.swift
//  Gallery
//
//  Created by bekkerman on 01.08.2022.
//

import Foundation

final class GalleryViewAssembly {
    func assemble() -> GalleryViewController {
        let loader = ServiceAssembly.shared.assembleImageLoader()
        let model = GalleryCollectionViewModel(loader: loader)
        let maneger = GalleryCollectionViewManager(model: model)

        let viewController = GalleryViewController(maneger: maneger)

        return viewController
    }
}
