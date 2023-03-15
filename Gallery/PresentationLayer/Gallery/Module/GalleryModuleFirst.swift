//
//  GalleryModuleFirst.swift
//  Gallery
//
//  Created by Kate Bekkerman on 20/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

import Foundation

@objc protocol GalleryModuleFirst: AnyObject {
//    var moduleOutput: GalleryModuleOutput? { get set }

    func configure(with cellModels: [GalleryCellModel], title: String)
}

@objc protocol GalleryModuleOutputFirst: AnyObject {
}
