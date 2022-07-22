//
//  GalleryItemBuilder.swift
//  Gallery
//
//  Created by bekkerman on 04.07.2022.
//

import Foundation

final class GalleryItemBuilder {
    func build(urlStrings: [String]) -> [GalleryItem] {
        var items = [GalleryItem]()

        for url in urlStrings {
            items.append(GalleryItem(urlString: url))
        }

        return items
    }
}
