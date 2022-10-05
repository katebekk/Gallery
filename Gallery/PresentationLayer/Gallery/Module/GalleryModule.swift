//
//  GalleryModule.swift
//  Gallery
//
//  Created by Kate Bekkerman on 20/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

import Foundation

@objc protocol GalleryModule: AnyObject {
    var moduleOutput: GalleryModuleOutput? { get set }

    func configure(with cellModels: [GalleryCellModel], title: String)
}

@objc protocol GalleryModuleOutput: AnyObject {
}
