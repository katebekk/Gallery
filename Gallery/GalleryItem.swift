//
//  GalleryItem.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 15.03.2022.
//

import Foundation

class GalleryItem {
    var imageName: String?
    var imageSourseUrl: String?
    
    init(imageName: String? = nil, imageSourseUrl: String? = nil) {
        self.imageName = imageName
        self.imageSourseUrl = imageSourseUrl
    }
}

extension GalleryItem {
    static let imagesCityUrls = [
        GalleryItem(imageSourseUrl: "https://cdn.pixabay.com/photo/2017/08/31/05/36/buildings-2699520_1280.jpg"),
        GalleryItem(imageSourseUrl: "https://cdn.pixabay.com/photo/2016/04/01/00/08/toronto-1298016_1280.jpg"),
        GalleryItem(imageSourseUrl: "https://cdn.pixabay.com/photo/2016/01/19/19/26/amsterdam-1150319_1280.jpg"),
        GalleryItem(imageSourseUrl: "https://cdn.pixabay.com/photo/2016/10/16/13/06/new-york-1745089_1280.jpg"),
        GalleryItem(imageSourseUrl: "https://cdn.pixabay.com/photo/2016/10/28/13/09/usa-1777986_1280.jpg"),
        GalleryItem(imageSourseUrl: "https://cdn.pixabay.com/photo/2015/03/11/12/31/buildings-668616_1280.jpg"),
    ]
    
    static let imagesCatsUrls = [
        GalleryItem(imageSourseUrl: "https://cdn.pixabay.com/photo/2021/01/04/12/07/cat-5887341_1280.jpg"),
        GalleryItem(imageSourseUrl: "https://cdn.pixabay.com/photo/2015/03/27/13/16/maine-coon-694730_1280.jpg"),
        GalleryItem(imageSourseUrl: "https://cdn.pixabay.com/photo/2017/11/13/07/14/cats-eyes-2944820_1280.jpg"),
        GalleryItem(imageSourseUrl: "https://cdn.pixabay.com/photo/2016/07/10/21/47/cat-1508613_1280.jpg"),
        GalleryItem(imageSourseUrl: "https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_1280.jpg"),
        GalleryItem(imageSourseUrl: "https://cdn.pixabay.com/photo/2016/02/10/16/37/cat-1192026_1280.jpg"),
    ]
    
}
