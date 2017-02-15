//
//  DetailController.swift
//  AppleStore
//
//  Created by Fernando Cardenas on 13/02/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class AppDetailController: UIViewController {
    
    var app: App? {
        didSet {
            if let image = app?.imageName {
                detailImage.image = UIImage(named: image)
            }
        }
    }
    
    let detailImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let payButton = UIBarButtonItem(title: "Pay", style: UIBarButtonItemStyle.plain, target: self, action: #selector(payApp))
        navigationItem.rightBarButtonItem = payButton

        setupViews()
        
    }
    
    func setupViews() {
        view.addSubview(detailImage)
        view.addConstrainstWithFormat("H:|[v0]|", views: detailImage)
        view.addConstrainstWithFormat("V:|[v0]|", views: detailImage)
    }
    
    func payApp(){
        print("Pay app")
    }
    
}
