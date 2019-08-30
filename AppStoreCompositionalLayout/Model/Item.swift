//
//  Item.swift
//  AppStoreCompositionalLayout
//
//  Created by Alfian Losari on 30/08/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//


import Foundation

struct Item: Hashable {
    
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }


    
}


extension Item {
    
    static var stubs: [Item] {
        return [
            Item(title: "Outdoor Cafe", subtitle: "It's so breezy", imageName: "image1"),
            Item(title: "Sunset Sky", subtitle: "Enjoy the sunset", imageName: "image2"),
            Item(title: "Great monument", subtitle: "So grandiose", imageName: "image3"),
            Item(title: "Blue Sky", subtitle: "Ahh so blue and calm", imageName: "image4"),
            Item(title: "Indoor Cafe", subtitle: "An industrial look", imageName: "image5"),
            Item(title: "At the Harbor", subtitle: "The ripple is so warming", imageName: "image6"),
            Item(title: "Watery Garden", subtitle: "So Relaxing", imageName: "image7"),
            Item(title: "Sports Cafe", subtitle: "Feeling the tension", imageName: "image8"),
            Item(title: "Glasses Everywhere", subtitle: "Looks amazing", imageName: "image9"),
            Item(title: "4th Avenue Cafe", subtitle: "So many people", imageName: "image10"),
            Item(title: "Keep on smiling", subtitle: "Keep the lifelong learning goes on 😋", imageName: "image11"),            
        ]
        
        
    }
    
    
    
    
}
