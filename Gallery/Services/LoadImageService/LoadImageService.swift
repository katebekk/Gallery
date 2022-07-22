//
//  ImageCache.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 28.02.2022.
//

import Foundation
import UIKit

final class LoadImageService {
    private enum Constants {
        static let imageErrorMessage = "Не удалось загрузить изображение"
    }

    static let shared = LoadImageService()
    private let cachedImages = NSCache<NSString, UIImage>()
}

extension LoadImageService {
    func fetchImage(urlString: String, completionHandler: @escaping (UIImage?, String?) -> Void) {
        if let cachedImage = getImageFromCache(url: urlString as NSString) {
            DispatchQueue.main.async {
                completionHandler(cachedImage, nil)
            }

            return
        }

        guard let url = URL(string: urlString) else {
            return
        }

        let getDataTask = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completionHandler(nil, error?.localizedDescription)
                }

                return
            }

            if let image = UIImage(data: data) {
                self?.cachedImages.setObject(image, forKey: urlString as NSString)
                DispatchQueue.main.async {
                    completionHandler(image, nil)
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler(nil, Constants.imageErrorMessage)
                }
            }
        }

        getDataTask.resume()
    }

    func clearCache() {
        cachedImages.removeAllObjects()
    }
}

private extension LoadImageService {
    func getImageFromCache(url: NSString) -> UIImage? {
        cachedImages.object(forKey: url)
    }
}
