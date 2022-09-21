//
//  MenuInteractor.swift
//  Gallery
//
//  Created by Kate Bekkerman on 20/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

final class MenuInteractor {
    var galleryItemBuilder: GalleryItemBuilder!
}

extension MenuInteractor: MenuInteractorInput {
    func buildGalleryItems(urlStrings: [String]) -> [GalleryCellModel] {
        galleryItemBuilder.build(urlStrings: urlStrings)
    }
}
