//
//  GalleryViewAssembly.swift
//  Gallery
//
//  Created by bekkerman on 01.08.2022.
//

import Swinject
import Foundation

final class MenuViewAssembly {
    private let container: Container = {
        let container = Container()

        container.register(MenuViewControllerRouter.self) { _ in
            MenuViewControllerRouter()
        }

        container.register(GalleryItemBuilder.self) { _ in
            ServiceAssembly.shared.galleryItemBuilder()
        }

        container.register(MenuViewController.self) { resolver in
            let viewController = MenuViewController()
            viewController.router = resolver.resolve(MenuViewControllerRouter.self)
            viewController.galleryItemBuilder = resolver.resolve(GalleryItemBuilder.self)
            return viewController
        }

        return container
    }()

    func viewController() -> MenuViewController {
        container.resolve(MenuViewController.self)!
    }
}
