//
//  ViewController.swift
//  instagram-explore
//
//  Created by Willa on 06/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var imageURls = ImageService.shared.getImageURLs(limit: 40)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    
    private func setupCollectionView(){
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.collectionViewLayout = generateLayout()
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        
        
        // Big photos
        let pairMainPhotoSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(2/3),
            heightDimension: .fractionalHeight(1.0))
        let pairMainPhotoItem = NSCollectionLayoutItem(layoutSize: pairMainPhotoSize)
        pairMainPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let pairSmallPhotoSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1/2))
        let pairSmallPhotoItem = NSCollectionLayoutItem(layoutSize: pairSmallPhotoSize)
        pairSmallPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let stackedSmallPhotoGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1.0)), subitem: pairSmallPhotoItem, count: 2)
        
        
        let mainAndSmallPhotoGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/3)), subitems: [stackedSmallPhotoGroup, pairMainPhotoItem])
        
        
        
        
        let smallPhotoSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let smallPhotoItem = NSCollectionLayoutItem(layoutSize: smallPhotoSize)
        smallPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let tripleSmallPhotoGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)), subitem: smallPhotoItem, count: 3)
        
        let stackedTripleSmallPhotoGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/3)), subitem: tripleSmallPhotoGroup, count: 2)
        
        
        
        let reversedMainAndSmallPhotoGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/3)), subitems: [ pairMainPhotoItem, stackedSmallPhotoGroup])
        
        
        
        
        
        
        let allGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0 + 1/4)),
            subitems: [
                mainAndSmallPhotoGroup,
                stackedTripleSmallPhotoGroup,
                reversedMainAndSmallPhotoGroup
            ])
        let section = NSCollectionLayoutSection(group: allGroup)
        return UICollectionViewCompositionalLayout(section: section)
    }

}


extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PhotoCollectionViewCell{
            let data = imageURls[indexPath.row]
            cell.url = data
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
}

