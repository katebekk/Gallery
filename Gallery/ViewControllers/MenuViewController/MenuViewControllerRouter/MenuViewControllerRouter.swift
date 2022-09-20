//
//  MenuViewControllerRouter.swift
//  Gallery
//
//  Created by bekkerman on 24.06.2022.
//

import Foundation

final class MenuViewControllerRouter {
    func presentGalleryView(viewController: MenuViewController, items: [GalleryCellModel], title: String) {
        let galleryViewController = MainAssembler.assembler.resolver.resolve(GalleryViewController.self)!
        galleryViewController.configure(items: items, title: title)

        viewController.navigationController?.pushViewController(galleryViewController, animated: true)
    }
}
