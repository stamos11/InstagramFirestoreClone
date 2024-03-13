//
//  FeedCell.swift
//  InstagramFirestoreClone
//
//  Created by stamoulis nikolaos on 8/3/24.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    // MARK: -Properties
    
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.backgroundColor = .systemPurple
        iv.image = UIImage(imageLiteralResourceName: "venom-7")
        return iv
    }()
    
    private lazy var userNameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("venom", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapUserName), for: .touchUpInside)
        return button
    }()
    
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(imageLiteralResourceName: "venom-7")
        return iv
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(imageLiteralResourceName: "like_unselected"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(imageLiteralResourceName: "comment"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(imageLiteralResourceName: "send2"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.text = "1 like"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "Some text caption for now"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 days ago"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .red
        return label
    }()
    
    // MARK: -Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
//        configureActionButtons()
        layout()
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        let stackView = UIStackView(arrangedSubviews: [likeButton, shareButton, commentButton])
        
        addSubview(profileImageView)
        addSubview(userNameButton)
        addSubview(postImageView)
        addSubview(stackView)
        addSubview(likesLabel)
        addSubview(captionLabel)
        addSubview(postTimeLabel)
        
        
        
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2
        
        userNameButton.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft:     8)
        
        postImageView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8)
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        
        stackView.anchor(top: postImageView.bottomAnchor, width: 120, height: 50)
        
        likesLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, paddingTop: -4, paddingLeft: 8)
        
        captionLabel.anchor(top: likesLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        
        postTimeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor,paddingTop: 8, paddingLeft: 8)
        
        
        

    }
    
    // MARK: Actions
    
    @objc func didTapUserName() {
        print("Debug: did tap username")
    }
    
}
