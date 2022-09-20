//
//  GalleryModule.swift
//  Gallery
//
//  Created by Kate Bekkerman on 17/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

import Foundation

protocol GalleryModule {
    var moduleOutput: GalleryModuleOutput? { get set }
}

protocol GalleryModuleOutput: AnyObject {
}
