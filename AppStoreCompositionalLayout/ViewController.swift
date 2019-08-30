//
//  ViewController.swift
//  AppStoreCompositionalLayout
//
//  Created by Alfian Losari on 30/08/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section: Hashable {
        case bannerCarousel([Item])
        case bannerSubItem([Item])
        case subItem([Item])
        case subItemLarge([Item])
        case itemThumbnail([Item])
        case basicItem([Item])
    }
    
    let data: [Section] = [
        .bannerCarousel(Item.stubs.shuffled()),
        .subItem(Item.stubs.shuffled()),
        .subItemLarge(Item.stubs.shuffled()),
        .itemThumbnail(Item.stubs.shuffled()),
        .bannerSubItem(Item.stubs.shuffled()),
        .basicItem(Item.stubs.shuffled())
    ]
    
    static let sectionHeaderElementKind = "section-header-element-kind"
    static let sectionFooterElementKind = "section-footer-element-kind"
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>! = nil
    var collectionView: UICollectionView! = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "App Store 😜"
        configureHierarchy()
        configureDataSource()
    }
    
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UINib(nibName: BannerHeroTextCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: BannerHeroTextCollectionViewCell.nibName)
        collectionView.register(UINib(nibName: SubItemCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: SubItemCollectionViewCell.nibName)
        collectionView.register(UINib(nibName: SubItemLargeCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: SubItemLargeCollectionViewCell.nibName)
        collectionView.register(UINib(nibName: ItemThumbnailTextCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: ItemThumbnailTextCollectionViewCell.nibName)
        collectionView.register(UINib(nibName: BannerSubItemCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: BannerSubItemCollectionViewCell.nibName)
        collectionView.register(UINib(nibName: BasicItemCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: BasicItemCollectionViewCell.nibName)
        collectionView.register(SeparatorCollectionReusableView.self, forSupplementaryViewOfKind: ViewController.sectionFooterElementKind, withReuseIdentifier: SeparatorCollectionReusableView.reuseIdentifier)
        collectionView.register(UINib(nibName: SectionHeaderTextReusableView.reuseIdentifier, bundle: nil), forSupplementaryViewOfKind: ViewController.sectionHeaderElementKind, withReuseIdentifier: SectionHeaderTextReusableView.reuseIdentifier)
        view.addSubview(collectionView)
    }
    
    func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (index, env) -> NSCollectionLayoutSection? in
            
            switch self.data[index] {
                
            case .bannerCarousel(_):
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .estimated(100))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                                       heightDimension: .estimated(100))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let spacing = CGFloat(10)
                group.interItemSpacing = .fixed(spacing)
                
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = spacing
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                        heightDimension: .absolute(1))
                
                let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: footerSize,
                    elementKind: ViewController.sectionFooterElementKind, alignment: .bottom)
                
                
                
                
                section.boundarySupplementaryItems = [sectionFooter]
                return section
                
            case .bannerSubItem(_):
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .estimated(100))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                                       heightDimension: .estimated(100))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let spacing = CGFloat(10)
                group.interItemSpacing = .fixed(spacing)
                
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = spacing
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                        heightDimension: .absolute(1))
                
                let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: footerSize,
                    elementKind: ViewController.sectionFooterElementKind, alignment: .bottom)
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: ViewController.sectionHeaderElementKind, alignment: .top)
                
                section.boundarySupplementaryItems = [sectionHeader, sectionFooter]
                return section
                
                
            case .subItem(_):
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(0.33))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                                       heightDimension: .absolute(236))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)
                
                let spacing = CGFloat(8)
                group.interItemSpacing = .fixed(spacing)
                
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = CGFloat(16)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                        heightDimension: .absolute(1))
                
                let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: footerSize,
                    elementKind: ViewController.sectionFooterElementKind, alignment: .bottom)
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: ViewController.sectionHeaderElementKind, alignment: .top)
                
                section.boundarySupplementaryItems = [sectionHeader, sectionFooter]
                return section
                
                
            case .subItemLarge(_):
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(0.5))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                                       heightDimension: .absolute(255))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
                
                let spacing = CGFloat(8)
                group.interItemSpacing = .fixed(spacing)
                
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = spacing
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
                let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                        heightDimension: .absolute(1))
                
                let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: footerSize,
                    elementKind: ViewController.sectionFooterElementKind, alignment: .bottom)
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: ViewController.sectionHeaderElementKind, alignment: .top)
                
                section.boundarySupplementaryItems = [sectionHeader, sectionFooter]
                return section
                
                
            case .itemThumbnail(_):
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(100))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                                       heightDimension: .estimated(100))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
                
                let spacing = CGFloat(8)
                group.interItemSpacing = .fixed(spacing)
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = spacing
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0)
                
                section.orthogonalScrollingBehavior = .groupPagingCentered
                let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                        heightDimension: .absolute(1))
                
                let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: footerSize,
                    elementKind: ViewController.sectionFooterElementKind, alignment: .bottom)
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: ViewController.sectionHeaderElementKind, alignment: .top)
                
                section.boundarySupplementaryItems = [sectionHeader, sectionFooter]
                return section
                
                
            case .basicItem(_):
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(100))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .estimated(100))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
                
                let spacing = CGFloat(8)
                group.interItemSpacing = .fixed(spacing)
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = spacing
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0)
                
                
                let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                        heightDimension: .absolute(1))
                
                let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: footerSize,
                    elementKind: ViewController.sectionFooterElementKind, alignment: .bottom)
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: ViewController.sectionHeaderElementKind, alignment: .top)
                
                section.boundarySupplementaryItems = [sectionHeader, sectionFooter]
                return section
            }
        }
    }
    
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Item) -> UICollectionViewCell? in
            
            let section = self.data[indexPath.section]
            
            switch section {
            case .bannerCarousel(_):
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: BannerHeroTextCollectionViewCell.nibName,
                    for: indexPath) as? BannerHeroTextCollectionViewCell else { fatalError("Cannot create new cell") }
                
                cell.setup(identifier)
                return cell
                
            case .bannerSubItem(_):
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: BannerSubItemCollectionViewCell.nibName,
                    for: indexPath) as? BannerSubItemCollectionViewCell else { fatalError("Cannot create new cell") }
                cell.setup(identifier)
                
                return cell
                
            case .basicItem(_):
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: BasicItemCollectionViewCell.nibName,
                    for: indexPath) as? BasicItemCollectionViewCell else { fatalError("Cannot create new cell") }
                cell.setup(identifier)
                
                return cell
            case .subItem(_):
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: SubItemCollectionViewCell.nibName,
                    for: indexPath) as? SubItemCollectionViewCell else { fatalError("Cannot create new cell") }
                
                cell.setup(identifier, index: indexPath.item + 1)
                return cell
                
                
            case .subItemLarge(_):
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: SubItemLargeCollectionViewCell.nibName,
                    for: indexPath) as? SubItemLargeCollectionViewCell else { fatalError("Cannot create new cell") }
                cell.setup(identifier)
                return cell
                
                
            case .itemThumbnail(_):
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ItemThumbnailTextCollectionViewCell.nibName,
                    for: indexPath) as? ItemThumbnailTextCollectionViewCell else { fatalError("Cannot create new cell") }
                cell.setup(identifier)
                return cell
                
            }
        }
        
        dataSource.supplementaryViewProvider = { (
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath) -> UICollectionReusableView? in
            
            let section = self.data[indexPath.section]
            
            
            if kind == ViewController.sectionHeaderElementKind {
                guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: SectionHeaderTextReusableView.reuseIdentifier,
                    for: indexPath) as? SectionHeaderTextReusableView else { fatalError("Cannot create new supplementary") }
                
                switch section {
                case .subItemLarge(_), .subItem(_), .itemThumbnail(_), .basicItem(_):
                    supplementaryView.subtitleLabel.isHidden = true
                    
                default:
                    supplementaryView.subtitleLabel.isHidden = false
                }
                
                return supplementaryView
            } else {
                guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: SeparatorCollectionReusableView.reuseIdentifier,
                    for: indexPath) as? SeparatorCollectionReusableView else { fatalError("Cannot create new supplementary") }
                return supplementaryView
            }
        }
        
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        data.forEach { section in
            snapshot.appendSections([section])
            switch section {
            case .bannerCarousel(let items), .subItem(let items), .subItemLarge(let items), .itemThumbnail(let items), .bannerSubItem(let items), .basicItem(let items):
                snapshot.appendItems(items)
            }
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

