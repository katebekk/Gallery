//
//  GalleryPresenter.swift
//  Gallery
//
//  Created by Kate Bekkerman on 17/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

import Foundation

final class GalleryPresenter {
    private enum Constants {
        static let delay = 1.0
    }

    var stateStorage: GalleryStateStorage!

    weak var view: GalleryViewInput?
}

extension GalleryPresenter: GalleryViewOutput {
    func viewDidLoad() {
        view?.configureView()
    }

    func onRefreshControlPull(with cellModels: [GalleryCellModel]) {
        view?.refreshWithDelay(Constants.delay)
    }
}
