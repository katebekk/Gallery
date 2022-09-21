//
//  MenuViewIO.swift
//  Gallery
//
//  Created by Kate Bekkerman on 20/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

protocol MenuViewInput: AnyObject {
    func configureView()
}

protocol MenuViewOutput {
    func viewDidLoad()
    func presentGalleryView(urlStrings: [String], title: String)
}
