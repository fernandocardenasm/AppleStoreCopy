//
//  ViewController.swift
//  AppleStore
//
//  Created by Fernando Cardenas on 9/01/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON

class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cell"
    
    var appCategories: [AppCategory]?
    
    var apiDataSource = ApiServiceDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchFeaturedAppsFeed()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
        
    func fetchFeaturedAppsFeed() {
        
        ApiServiceDataSource.sharedInstance.fetchFeaturedAppsFeed { (categories) in
            self.appCategories = categories
            self.collectionView?.reloadData()
        }
    }
    
    func showAppDetailForApp(app: App){
        let appDetailController = AppDetailController()
        appDetailController.app = app
        navigationController?.pushViewController(appDetailController, animated: true)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = appCategories?.count {
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        
        cell.appCategory = appCategories?[indexPath.item]
        cell.featuredAppController = self
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(view.frame.width - 28, 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }

}

