//
//  CommentCell.swift
//  InstagramFirestoreClone
//
//  Created by stamoulis nikolaos on 1/5/24.
//

import UIKit

class CommentCell: UICollectionViewCell {
    
    //MARK: -Properties
    
    var viewModel: CommentViewModel? {
        didSet {configure()}
    }
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }()
    private let commentLabel: UILabel = {
        let iv = UILabel()
        iv.textColor = .black
        iv.numberOfLines = 0
        return iv
    }()
       

    
    //MARK: -Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        profileImageView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 8)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2 
        
        addSubview(commentLabel)
        commentLabel.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
        commentLabel.anchor(right: rightAnchor, paddingRight: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: -Helpers
    
    func configure() {
        guard let viewModel = viewModel  else {return}
        
        profileImageView.sd_setImage(with: viewModel.profileImageUrl)
        commentLabel.attributedText = viewModel.commentLabelText()
    }
 
}
