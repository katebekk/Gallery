//
//  GalleryItemBuilder.swift
//  Gallery
//
//  Created by bekkerman on 04.07.2022.
//

import Foundation

final class GalleryItemBuilder {
    func buildItemsArray(urlStrings: [String]) -> [GalleryItem] {
        var galleryItems = [GalleryItem]()
        for url in urlStrings {
            galleryItems.append(GalleryItem(urlString: url))
        }

        return galleryItems
    }
}
