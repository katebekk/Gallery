//
//  MenuPresenter.swift
//  Gallery
//
//  Created by Kate Bekkerman on 20/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

final class MenuPresenter {
    var interactor: MenuInteractorInput!
    var router: MenuRouterInput!
    var stateStorage: MenuStateStorage!

    weak var view: MenuViewInput?
    weak var moduleOutput: MenuModuleOutput?
}

extension MenuPresenter: MenuModule {
}

extension MenuPresenter: MenuViewOutput {
    func viewDidLoad() {
        view?.configureView()
    }

    func presentGalleryView(urlStrings: [String], title: String) {
        let cellModels = interactor.buildGalleryItems(urlStrings: urlStrings)
        router.presentGalleryView(with: cellModels, title: title)
    }
}
