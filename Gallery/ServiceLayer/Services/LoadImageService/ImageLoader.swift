//
//  LoadImageService.swift
//  Gallery
//
//  Created by bekkerman on 01.08.2022.
//

import Foundation
import UIKit

protocol ImageLoader {
    func fetchImage(urlString: String, completionHandler: @escaping (UIImage?, Error?) -> Void)
    func clearCache()
}
