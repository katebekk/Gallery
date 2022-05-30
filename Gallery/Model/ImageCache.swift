//
//  ImageCache.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 28.02.2022.
//

import Foundation
import UIKit

final class ImageCache {
    static let shared = ImageCache()
    private let cachedImages = NSCache<NSString, UIImage>()
    
    private init(){}
}

extension ImageCache {
    func fetchImage(urlString: String, imageView: UIImageView, spiner: UIActivityIndicatorView) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let getDataTask = URLSession.shared.dataTask(with: url) { data, _,  error in
            guard let data = data, error == nil else {
                return
            }
            
            if let cachedImage = self.getImageFromCache(url: urlString as NSString) {
                DispatchQueue.main.async {
                    imageView.image = cachedImage
                    spiner.stopAnimating()
                }
                return
            }
            if let image = UIImage(data: data) {
                self.cachedImages.setObject(image, forKey: urlString as NSString)
                DispatchQueue.main.async {
                    imageView.image = image
                    spiner.stopAnimating()
                }
            }
        }
        
        getDataTask.resume()
    }
}

private extension ImageCache {
    func getImageFromCache(url: NSString) -> UIImage? {
        return cachedImages.object(forKey: url)
    }
}
