//
//  LoadImageService.swift
//  Gallery
//
//  Created by bekkerman on 01.08.2022.
//

import UIKit

@objc protocol ImageLoader: AnyObject {
    func fetchImage(urlString: String, completionHandler: @escaping (UIImage?, Error?) -> Void)
    func clearCache()
}
