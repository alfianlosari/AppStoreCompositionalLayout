//
//  BannerSubItemCollectionViewCell.swift
//  AppStoreCompositionalLayout
//
//  Created by Alfian Losari on 30/08/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

class BannerSubItemCollectionViewCell: UICollectionViewCell {
    
    static var nibName: String { return "BannerSubItemCollectionViewCell" }
    
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    func setup(_ item: Item) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        imageView.image = UIImage(named: item.imageName)
        bannerImageView.image = UIImage(named: item.imageName)
    }
    
    
}
