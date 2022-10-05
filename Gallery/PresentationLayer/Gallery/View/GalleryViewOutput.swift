//
//  GalleryViewOutput.swift
//  Gallery
//
//  Created by Kate Bekkerman on 17/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//
//

@objc protocol GalleryViewOutput {
    func viewDidLoad()
    func onRefresh(with cellModels: [GalleryCellModel])
}
