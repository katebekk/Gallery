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
        static let cellIdentifier = "Cell"

        static let refreshDuration = 1.0
        static let сellAnimationDuration = 1.0
    }

    var interactor: GalleryInteractorInput!
    var stateStorage: GalleryStateStorage!

    weak var view: GalleryViewInput?
    weak var moduleOutput: GalleryModuleOutput?
}

extension GalleryPresenter: GalleryModule {
}

extension GalleryPresenter: GalleryViewOutput {
    func viewDidLoad() {
        view?.configureView()
    }

    func onRefreshControlPull(with cellModels: [GalleryCellModel]) {
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.refreshDuration) { [weak self] in
            guard let self = self else { return }

            self.view?.reload(with: cellModels)
            self.view?.endRefreshing()
        }
    }
}
