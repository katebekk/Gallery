//
//  GalleryItemBuilder.swift
//  Gallery
//
//  Created by bekkerman on 04.07.2022.
//

import Foundation

final class GalleryItemBuilderImpl: GalleryItemBuilder {
    func build(urlStrings: [String]) -> [GalleryItem] {
        urlStrings.map { GalleryItem(urlString: $0) }
    }
}
