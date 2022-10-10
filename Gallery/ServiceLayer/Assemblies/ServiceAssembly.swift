//
//  ServiceAssembly.swift
//  Gallery
//
//  Created by bekkerman on 01.08.2022.
//

import Swinject
import Foundation

final class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GalleryItemBuilder.self) { _ in
            GalleryItemBuilderImpl()
        }.inObjectScope(.container)

        container.register(ImageLoader.self) { _ in
            ImageLoaderImpl()
        }.inObjectScope(.container)
    }
}
