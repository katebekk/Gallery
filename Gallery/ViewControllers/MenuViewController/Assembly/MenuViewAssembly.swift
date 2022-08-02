//
//  GalleryViewAssembly.swift
//  Gallery
//
//  Created by bekkerman on 01.08.2022.
//

import Foundation

final class MenuViewAssembly {
    func assemble() -> MenuViewController {
        let router = MenuViewControllerRouter()
        let builder = ServiceAssembly.shared.assembleGalleryItemBuilder()

        let viewController = MenuViewController(router: router, builder: builder)

        return viewController
    }
}
