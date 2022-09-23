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
            let interactor = GalleryInteractor()
            let imageLoader = resolver.resolve(ImageLoader.self)
            let presenter = GalleryPresenter()
            let stateStorage = GalleryStateStorage()

            interactor.imageLoader = imageLoader

            presenter.view = viewController
            presenter.interactor = interactor
            presenter.stateStorage = stateStorage

            viewController.output = presenter

            let model = GalleryCollectionViewModel()
            model.interactor = interactor

            let manager = GalleryCollectionViewManager()
            manager.collectionViewModel = model

            viewController.collectionViewManager = manager
        }
    }
}
