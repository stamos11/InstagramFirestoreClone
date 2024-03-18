//
//  RegistratioController.swift
//  InstagramFirestoreClone
//
//  Created by stamoulis nikolaos on 14/3/24.
//

import UIKit

class RegistrationController: UIViewController {
    
    // MARK: -Properties
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(imageLiteralResourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let emailTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Email")
       
        tf.keyboardType = .emailAddress
       
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
       
        return tf
    }()
    
    private let fullnameTextField = CustomTextField(placeholder: "Fullname")
    private let usernameTextField = CustomTextField(placeholder: "Username")
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize:20)
        
        return button
    }()
    
    private let AlreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Already have an account?", secondPart: "Sign Up")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    // MARK: -Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: Actions
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: -Helpers
    
    func configureUI() {
        configureGradientLayer()
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.setDimensions(height: 140, width: 140)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullnameTextField, usernameTextField, signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(AlreadyHaveAccountButton)
        AlreadyHaveAccountButton.centerX(inView: view)
        AlreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
}
