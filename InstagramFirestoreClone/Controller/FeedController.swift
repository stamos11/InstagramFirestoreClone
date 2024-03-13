//
//  FeedController.swift
//  InstagramFirestoreClone
//
//  Created by stamoulis nikolaos on 6/3/24.
//

import UIKit

class FeedController: UICollectionViewController {

private let reuseIdentifier = "Cell"
// MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    
    // MARK: -Helpers
    
    func configureUI() {
        collectionView.backgroundColor = .white
        
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}


// MARK: -UIcollectionViewDataSource
extension FeedController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        as! FeedCell
        return cell
    }
}

// MARK: -UICollectionViewDataSource

extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        var height = width + 8 + 40 + 8
        height += 50
        height += 60
        return CGSize(width: width, height: height)
    }
}
