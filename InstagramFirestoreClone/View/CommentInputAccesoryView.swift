//
//  CommentInputAccesoryView.swift
//  InstagramFirestoreClone
//
//  Created by stamoulis nikolaos on 2/5/24.
//

import UIKit

class CommentInputAccesoryView: UIView {
    
///    MARK: -Properties
    private let commentTextView: InputTextView = {
        let tv = InputTextView()
        tv.backgroundColor = .white
        tv.placeHolderText = "Enter comment.."
        tv.textColor = .black
        tv.font = UIFont.systemFont(ofSize: 15)
        return tv
    }()
 
    private let postButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Post", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handlePostTapped), for: .touchUpInside)
        return button
    }()
    
    ///MARK: -Lifecycle
    override init(frame: CGRect){
        super.init(frame: frame)
        
        autoresizingMask = .flexibleWidth
        
        addSubview(postButton)
        postButton.anchor(top: topAnchor, right: rightAnchor, paddingRight: 8)
        postButton.setDimensions(height: 50, width: 50)
        
        addSubview(commentTextView)
        
        commentTextView.translatesAutoresizingMaskIntoConstraints = false
        
        commentTextView.anchor(top: topAnchor, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: postButton.leftAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8,paddingRight: 8)
        print("CommentTextVieW Frame: \(commentTextView.frame)")

        
        let divider = UIView()
        addSubview(divider)
        divider.backgroundColor = .black
        divider.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///MARK: -Actions
    
    @objc func handlePostTapped() {
        
    }
}
