//
//  MenuRouter.swift
//  Gallery
//
//  Created by Kate Bekkerman on 20/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

import UIKit

final class MenuRouter {
    weak var viewController: UIViewController?
}

extension MenuRouter: MenuRouterInput {
    func presentGalleryView(with cellModels: [GalleryCellModel], title: String) {
        let galleryViewController = MainAssembler.assembler.resolver.resolve(GalleryViewController.self)!
        galleryViewController.galleryModule.configure(cellModels, title: title)

        viewController?.navigationController?.pushViewController(galleryViewController, animated: true)
    }
}
