//
//  SeparatorCollectionReusableView.swift
//  AppStoreCompositionalLayout
//
//  Created by Alfian Losari on 30/08/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

class SeparatorCollectionReusableView: UICollectionReusableView {
    
    let separatorView = UIView()
    
      static let reuseIdentifier = "SeparatorCollectionReusableView"

      override init(frame: CGRect) {
          super.init(frame: frame)
          configure()
      }
      required init?(coder: NSCoder) {
          fatalError()
      }
    
    func configure() {
         addSubview(separatorView)
         separatorView.translatesAutoresizingMaskIntoConstraints = false
         let inset = CGFloat(16)
         NSLayoutConstraint.activate([
             separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
             separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
             separatorView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
             separatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
             separatorView.heightAnchor.constraint(equalToConstant: 1.0)
         ])
        separatorView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 0.8)
     }
    
    
}
