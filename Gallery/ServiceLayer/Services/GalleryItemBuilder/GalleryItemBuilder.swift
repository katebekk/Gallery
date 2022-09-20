//
//  GalleryItemBuilder.swift
//  Gallery
//
//  Created by bekkerman on 01.08.2022.
//

import Foundation

protocol GalleryItemBuilder {
    func build(urlStrings: [String]) -> [GalleryCellModel]
}
