//
//  GalleryItem.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 15.03.2022.
//

import Foundation

@objcMembers
final class GalleryCellModel: NSObject {
    var urlString: String!

    init(urlString: String) {
        self.urlString = urlString
    }
}
