//
//  SubItemCollectionViewCell.swift
//  AppStoreCompositionalLayout
//
//  Created by Alfian Losari on 30/08/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

class SubItemCollectionViewCell: UICollectionViewCell {
    
    static var nibName: String { return "SubItemCollectionViewCell" }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    
    
    func setup(_ item: Item, index: Int) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        imageView.image = UIImage(named: item.imageName)
        indexLabel.text = String(index)
    }
    
    
}
