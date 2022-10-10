//
//  MenuRouterInput.swift
//  Gallery
//
//  Created by Kate Bekkerman on 20/09/2022.
//  Copyright © 2022 katebekk. All rights reserved.
//

import UIKit

protocol MenuRouterInput {
    func presentGalleryView(with cellModels: [GalleryCellModel], title: String)
}
