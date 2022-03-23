//
//  ImageCache.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 28.02.2022.
//

import Foundation
import UIKit

public class ImageCache {
    public static let publicCache = ImageCache()
    private let cachedImages = NSCache<NSString, UIImage>()
    
    public final func image(url: NSString) -> UIImage? {
        return cachedImages.object(forKey: url)
    }
    
    final func fetchImage(urlString: String, imageView: UIImageView) {
        if let url = URL(string: urlString) {
            let getDataTask = URLSession.shared.dataTask(with: url) { data, _,  error in
                guard let data = data, error == nil else {
                    return
                }
                
                if let cachedImage = self.image(url: urlString as NSString ) {
                    DispatchQueue.main.async {
                        imageView.image = cachedImage
                    }
                    return
                }
                if let image = UIImage(data: data) {
                    self.cachedImages.setObject(image, forKey: urlString as NSString)
                    DispatchQueue.main.async {
                        imageView.image = image
                    }
                }
            }

            getDataTask.resume()
        }
    }
}
