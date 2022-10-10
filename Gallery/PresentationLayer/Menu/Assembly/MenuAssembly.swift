//
//  MenuAssembly.swift
//  Gallery
//
//  Created by Kate Bekkerman on 20/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

import UIKit
import Swinject

final class MenuAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MenuViewController.self) { _ in
            MenuViewController()
        }.initCompleted { resolver, viewController in
            let router = MenuRouter()
            let interactor = MenuInteractor()
            let presenter = MenuPresenter()
            let stateStorage = MenuStateStorage()

            router.viewController = viewController

            interactor.galleryItemBuilder = resolver.resolve(GalleryItemBuilder.self)

            presenter.view = viewController
            presenter.interactor = interactor
            presenter.router = router
            presenter.stateStorage = stateStorage

            viewController.module = presenter
            viewController.output = presenter
        }
    }
}
