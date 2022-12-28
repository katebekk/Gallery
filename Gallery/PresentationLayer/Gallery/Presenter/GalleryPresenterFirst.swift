//
//  GalleryPresenterFirst.swift
//  Gallery
//
//  Created by Kate Bekkerman on 17/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

import Foundation

final class GalleryPresenterFirst: NSObject {
    var stateStorage: GalleryStateStorage!

    weak var view: GalleryViewInput?
    weak var moduleOutput: GalleryModuleOutput?
}

extension GalleryPresenterFirst: GalleryModule {
    func configure(_ cellModels: [GalleryCellModel], title: String) {
        view?.configure(cellModels, title: title)
    }
}

extension GalleryPresenterFirst: GalleryViewOutput {
    func viewDidLoad() {
        view?.configureView()
    }

    func onRefresh() {
        view?.refreshWithDelay()
    }
}
