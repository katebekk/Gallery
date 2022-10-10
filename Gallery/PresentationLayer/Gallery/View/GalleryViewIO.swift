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
    func refreshWithDelay()
}

protocol GalleryViewOutput {
    func viewDidLoad()
    func onRefresh(with cellModels: [GalleryCellModel])
}
