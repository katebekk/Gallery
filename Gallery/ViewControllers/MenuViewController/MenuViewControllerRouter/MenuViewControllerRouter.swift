//
//  MenuViewControllerRouter.swift
//  Gallery
//
//  Created by bekkerman on 24.06.2022.
//

import Foundation

final class MenuViewControllerRouter {
    func presentGalleryView(viewController: MenuViewController, items: [GalleryItem], title: String) {
        let galleryViewController = GalleryViewAssembly().assemble()
        galleryViewController.configure(items: items, title: title)

        viewController.navigationController?.pushViewController(galleryViewController, animated: true)
    }
}
