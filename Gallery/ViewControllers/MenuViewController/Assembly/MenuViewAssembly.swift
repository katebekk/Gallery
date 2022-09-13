//
//  GalleryViewAssembly.swift
//  Gallery
//
//  Created by bekkerman on 01.08.2022.
//

import Swinject
import Foundation

final class MenuViewAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MenuViewController.self) { resolver in
            let viewController = MenuViewController()

            viewController.router = MenuViewControllerRouter()
            viewController.galleryItemBuilder = resolver.resolve(GalleryItemBuilder.self)

            return viewController
        }
    }
}
