//
//  GalleryPresenter.swift
//  Gallery
//
//  Created by Kate Bekkerman on 17/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

import Foundation

final class GalleryPresenter {
    var stateStorage: GalleryStateStorage!

    weak var view: GalleryViewInput?
    weak var moduleOutput: GalleryModuleOutput?
}

extension GalleryPresenter: GalleryModule {
    func configure(with cellModels: [GalleryCellModel], title: String) {
        view?.configure(with: cellModels, title: title)
    }
}

extension GalleryPresenter: GalleryViewOutput {
    func viewDidLoad() {
        view?.configureView()
    }

    func onRefresh(with cellModels: [GalleryCellModel]) {
        view?.refreshWithDelay()
    }
}
