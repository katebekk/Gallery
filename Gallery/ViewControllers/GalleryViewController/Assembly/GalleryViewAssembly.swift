//
//  GalleryViewAssembler.swift
//  Gallery
//
//  Created by bekkerman on 01.08.2022.
//

import Swinject
import Foundation

final class GalleryViewAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GalleryViewController.self) { resolver in
            let model = GalleryCollectionViewModel()
            let manager = GalleryCollectionViewManager()
            let viewController = GalleryViewController()

            model.loader = resolver.resolve(ImageLoader.self)
            manager.collectionViewModel = model
            viewController.collectionViewManager = manager

            return viewController
        }
    }
}
