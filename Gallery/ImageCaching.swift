//
//  ImageCaching.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 25.02.2022.
//

import Foundation
import UIKit

class ImageCaching {
    static let catchImage = NSCache<NSString, UIImage>()


    // Создать функцию
    static func DownloadImage(withURL url : URL, complition : _ image : UIImage -> ()) {

    let dataTask = URLSession.shared.dataTask(with: url) {data, urlData, error in

    let defImage = UIImage(named: "cloud")!
    var downloadImage : UIImage?

    if let data = data {
    downloadImage = UIImage(data: data)
    }

    if downloadImage != nil {
    catchImage.setObject(downloadImage!, forKey: url.absoluteString as NSString)
    }

    DispatchQueue.main.async {
    complition(downloadImage ?? defImage)
    }
    }


    dataTask.resume()
    }



    static func getImage(withURL url : URL, complition : _ image : UIImage -> ()) {

    if let image = catchImage.object(forKey: url.absoluteString as NSString) {
    complition(image)

    } else {
    DownloadImage(withURL: url, complition: complition)
    }
    }
}
