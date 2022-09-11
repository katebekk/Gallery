//
//  ServiceAssembly.swift
//  Gallery
//
//  Created by bekkerman on 01.08.2022.
//

import Foundation

final class ServiceAssembly {
    static let shared = ServiceAssembly()

    func galleryItemBuilder() -> GalleryItemBuilder {
        GalleryItemBuilderImpl()
    }

    func imageLoader() -> ImageLoader {
        ImageLoaderImpl()
    }
}
