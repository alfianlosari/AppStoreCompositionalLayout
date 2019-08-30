//
//  SectionHeaderTextReusableView.swift
//  AppStoreCompositionalLayout
//
//  Created by Alfian Losari on 30/08/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

class SectionHeaderTextReusableView: UICollectionReusableView {
    
    static let reuseIdentifier = "SectionHeaderTextReusableView"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
