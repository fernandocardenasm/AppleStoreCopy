//
//  CategoryCell.swift
//  AppleStore
//
//  Created by Fernando Cardenas on 10/01/17.
//  Copyright © 2017 Fernando. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    func setupViews() {
        backgroundColor = .clear
        
        addSubview(appsCollectionView)
        
        appsCollectionView.backgroundColor = .red
        
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: cellId)
        
        addConstrainstWithFormat("H:|[v0]|", views: appsCollectionView)
        addConstrainstWithFormat("V:|[v0]|", views: appsCollectionView)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(100, frame.height)
    }
}

class AppCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "frozen")
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Disney Build IT: Frozen"
        label.backgroundColor = .blue
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Entertainment"
        label.backgroundColor = .yellow
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews(){        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        
        addConstrainstWithFormat("H:|[v0]|", views: imageView)
        addConstrainstWithFormat("V:[v0(100)]-2-[v1(40)]-2-[v2(20)]", views: imageView, nameLabel, categoryLabel)
        addConstrainstWithFormat("H:|[v0]|", views: nameLabel)
        addConstrainstWithFormat("H:|[v0]|", views: categoryLabel)
        
        //addConstrainstWithFormat("V:|[v0(80)]-2-[v1]-2-|", views: imageView, nameLabel)
        //addConstrainstWithFormat("H:|[v0]|", views: nameLabel)

        
        //imageView.frame = CGRect(0, 0, frame.width, frame.height)
        //nameLabel.frame = CGRect(0, frame.width + 2, frame.width, 40)
    }
}
