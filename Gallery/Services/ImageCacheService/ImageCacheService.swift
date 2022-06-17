//
//  ImageCache.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 28.02.2022.
//

import Foundation
import UIKit

final class ImageCacheService {
    static let shared = ImageCacheService()
    private let cachedImages = NSCache<NSString, UIImage>()

    private init() {}
}

extension ImageCacheService {
    func fetchImage(urlString: String, setImageHandler: @escaping (UIImage) -> Void, stopSpinerHandler: @escaping () -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }

        let getDataTask = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }

            if let cachedImage = self?.getImageFromCache(url: urlString as NSString) {
                DispatchQueue.main.async {
                    setImageHandler(cachedImage)
                    stopSpinerHandler()
                }
                return
            }
            if let image = UIImage(data: data) {
                self?.cachedImages.setObject(image, forKey: urlString as NSString)
                DispatchQueue.main.async {
                    setImageHandler(image)
                    stopSpinerHandler()
                }
            }
        }

        getDataTask.resume()
    }
}

private extension ImageCacheService {
    func getImageFromCache(url: NSString) -> UIImage? {
        cachedImages.object(forKey: url)
    }
}
