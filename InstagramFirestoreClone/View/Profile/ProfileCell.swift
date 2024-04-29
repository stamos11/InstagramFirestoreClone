//
//  ProfileCell.swift
//  InstagramFirestoreClone
//
//  Created by stamoulis nikolaos on 6/4/24.
//

import UIKit


class ProfileCell: UICollectionViewCell {
    
    //MARK: -Properties
    
    var viewModel: PostViewModel? {
        didSet {
            configure()
        }
    }
    
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    //MARK: -Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .gray
        addSubview(postImageView)
        postImageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure() {
        guard let viewModel = viewModel else {return}
        
        postImageView.sd_setImage(with: viewModel.imageUrl)
    }
}

