//
//  GalleryViewAssembler.swift
//  Gallery
//
//  Created by bekkerman on 01.08.2022.
//

import Swinject
import Foundation

final class GalleryViewAssembly {
    private let container: Container = {
        let container = Container()

        container.register(ImageLoader.self) { _ in
            ServiceAssembly.shared.imageLoader()
        }

        container.register(GalleryCollectionViewModel.self) { resolver in
            let model = GalleryCollectionViewModel()
            model.loader = resolver.resolve(ImageLoader.self)
            return model
        }

        container.register(GalleryCollectionViewManager.self) { resolver in
            let manager = GalleryCollectionViewManager()
            manager.collectionViewModel = resolver.resolve(GalleryCollectionViewModel.self)
            return manager
        }

        container.register(GalleryViewController.self) { resolver in
            let viewController = GalleryViewController()
            viewController.collectionViewManager = resolver.resolve(GalleryCollectionViewManager.self)
            return viewController
        }

        return container
    }()

    func viewController() -> GalleryViewController {
        container.resolve(GalleryViewController.self)!
    }
}
