//
//  ResetPasswordController.swift
//  InstagramFirestoreClone
//
//  Created by stamoulis nikolaos on 16/5/24.
//

import UIKit


class ResetPasswordController: UIViewController {
    //MARK: -Properties
    private let emailTextField = CustomTextField(placeholder: "Email")
    private let iconImage: UIImageView = {
        let iv = UIImageView(image: UIImage(imageLiteralResourceName: "Instagram_logo_white"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    private let resetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset password", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple.withAlphaComponent(0.5)
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize:20)
        button.addTarget(self, action: #selector(handleShowResetPassword), for: .touchUpInside)
        return button
    }()
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        return button
    }()
    //MARK: -Lifecycle
    
    override func viewDidLoad() {
        configureUI()
    }
    //MARK: -Actions
    @objc func handleShowResetPassword() {
        
    }
    @objc func handleDismissal() {
        navigationController?.popViewController(animated: true)
    }
    //MARK: -Helpers
    
    func configureUI() {
        configureGradientLayer()
        
        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 16, paddingLeft: 16)
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, resetPasswordButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    }
    
}
