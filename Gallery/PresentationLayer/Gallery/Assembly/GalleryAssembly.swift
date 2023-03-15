//
//  GalleryAssembly.swift
//  Gallery
//
//  Created by Kate Bekkerman on 17/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

import UIKit
import Swinject

final class GalleryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GalleryViewController.self) { _ in
            GalleryViewController()
        }.initCompleted { resolver, viewController in
            let imageLoader = resolver.resolve(ImageLoader.self)
            let presenter = GalleryPresenter()
            let stateStorage = GalleryStateStorage()

            presenter.view = viewController
            presenter.stateStorage = stateStorage

            viewController.output = presenter

            let model = GalleryCollectionViewModel()
            model.imageLoader = imageLoader!

            let manager = GalleryCollectionViewManager()
            manager.collectionViewModel = model

            viewController.galleryModule = presenter
            viewController.collectionViewManager = manager
        }
    }
}
