//
//  ViewController.swift
//  CollectionViewTask
//
//  Created by George on 13.12.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = createLayout()
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView.backgroundColor = UIColor.cyan
        
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .gray
        collectionView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 51
    }

    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.backgroundColor = UIColor.lightGray // make cell more visible in our example project
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    private func createLayout() -> UICollectionViewLayout {
       
    
        let containerGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(480))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: containerGroupSize, 
                                                     subitems: [getGroup1(),
                                                                getGroup2(),
                                                                getGroup3(),
                                                                getGroup4()
                                                               ])
        
        group.interItemSpacing = .fixed(10)
        group.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    
    func getGroup1() -> NSCollectionLayoutGroup {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.leading = 50.0
        item.contentInsets.trailing = 10.0
        
        let item2 = NSCollectionLayoutItem(layoutSize: itemSize)
        item2.contentInsets.trailing = 50.0
        item2.contentInsets.leading = 10.0
        
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(100))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item,item2])
        
        return group
    
    }
    
    func getGroup2() -> NSCollectionLayoutGroup {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.leading = 100
        item.contentInsets.trailing = 100
    
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(100))
        
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        return group
    
    }
    
    
    func getGroup3() -> NSCollectionLayoutGroup {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.3),
            heightDimension: .fractionalHeight(1))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.leading = 50.0
        item.contentInsets.trailing = 10
        
        let item2 = NSCollectionLayoutItem(layoutSize: itemSize)
        item2.contentInsets.trailing = 10
        item2.contentInsets.leading = 10
        
        let item3 = NSCollectionLayoutItem(layoutSize: itemSize)
        item3.contentInsets.trailing = 10.0
        item3.contentInsets.leading = 50
        
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(100))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item,item2,item3])
        
        return group
    
    }
    
    func getGroup4() -> NSCollectionLayoutGroup {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.2),
            heightDimension: .fractionalHeight(1))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.bottom = 50.0
        
        let item2 = NSCollectionLayoutItem(layoutSize: itemSize)
        item2.contentInsets.top = 50.0
        
        
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(100))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item,item2])
        
        return group
    
    }
}

