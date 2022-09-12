//
//  ServiceAssembly.swift
//  Gallery
//
//  Created by bekkerman on 01.08.2022.
//

import Swinject
import Foundation

final class ServiceAssembly {
    static let shared = ServiceAssembly()

    private let container: Container = {
        let container = Container()

        container.register(GalleryItemBuilder.self) { _ in
            GalleryItemBuilderImpl()
        }

        container.register(ImageLoader.self) { _ in
            ImageLoaderImpl()
        }

        return container
    }()

    func galleryItemBuilder() -> GalleryItemBuilder {
        container.resolve(GalleryItemBuilder.self)!
    }

    func imageLoader() -> ImageLoader {
        container.resolve(ImageLoader.self)!
    }
}
