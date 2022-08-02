//
//  ServiceAssembly.swift
//  Gallery
//
//  Created by bekkerman on 01.08.2022.
//

import Foundation

final class ServiceAssembly {
    static let shared = ServiceAssembly()

    func assembleGalleryItemBuilder() -> GalleryItemBuilder {
        let builder = GalleryItemBuilderImpl()

        return builder
    }

    func assembleImageLoader() -> ImageLoader {
        let loader = ImageLoaderImpl()

        return loader
    }
}
