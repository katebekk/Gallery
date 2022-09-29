//
//  GalleryModule.swift
//  Gallery
//
//  Created by Kate Bekkerman on 20/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

import Foundation

protocol GalleryModule {
    var moduleOutput: GalleryModuleOutput? { get set }

    func configure(with cellModels: [GalleryCellModel], title: String)
}

protocol GalleryModuleOutput: AnyObject {
}
