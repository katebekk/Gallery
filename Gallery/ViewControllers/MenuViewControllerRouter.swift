//
//  MenuViewControllerRouter.swift
//  Gallery
//
//  Created by bekkerman on 24.06.2022.
//

import Foundation

final class MenuViewControllerRouter {
    weak var viewController: MenuViewController?

    init(menuViewController: MenuViewController) {
        viewController = menuViewController
    }

    func presentGalleryView(galleryItemsList: [GalleryItem], title: String) {
        let galleryViewController = GalleryViewController(galleryItemsList: galleryItemsList, title: title)

        viewController?.navigationController?.pushViewController(galleryViewController, animated: true)
    }
}
