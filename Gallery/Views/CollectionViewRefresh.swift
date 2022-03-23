//
//  CollectionViewRefresh.swift
//  TestTakFirstTry
//
//  Created by bekkerman on 11.03.2022.
//

import UIKit

class CollectionViewRefresh: UIRefreshControl {
    func handelRefresh(sender: UIRefreshControl){
        carrentImages = imagesStartState
        collectionView.reloadData()
        
        refresh.endRefreshing()
    }

}
