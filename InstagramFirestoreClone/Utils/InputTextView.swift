//
//  InputTextView.swift
//  InstagramFirestoreClone
//
//  Created by stamoulis nikolaos on 19/4/24.
//

import UIKit



class InputTextView: UITextView {
    
    //MARK: -Properties
    
    var placeHolderText: String? {
        didSet {
            placeHolderLabel.text = placeHolderText
        }
    }
     let placeHolderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    var placeHolderShouldCenter = true {
        didSet {
            if placeHolderShouldCenter {
                placeHolderLabel.anchor(left: leftAnchor, right: rightAnchor, paddingLeft: 8)
                placeHolderLabel.centerY(inView: self)
            } else {
                placeHolderLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 6, paddingLeft: 8)

            }
        }
    }
    
    //MARK: -Lifecycle
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        addSubview(placeHolderLabel)
        placeHolderLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 6, paddingLeft: 8)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextDidChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func handleTextDidChange() {
        placeHolderLabel.isHidden = !text.isEmpty
    }
}
