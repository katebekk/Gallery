//
//  GalleryViewIO.swift
//  Gallery
//
//  Created by Kate Bekkerman on 17/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

protocol GalleryViewInput: AnyObject {
    func configureView()
    func configure(with cellModels: [GalleryCellModel], title: String)
    func reload(with cellModels: [GalleryCellModel])
    func endRefreshing()
}

protocol GalleryViewOutput {
    func viewDidLoad()
    func onRefreshControlPull(with cellModels: [GalleryCellModel])
}
