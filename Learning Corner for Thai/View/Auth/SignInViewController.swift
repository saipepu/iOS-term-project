//
//  SignInViewController.swift
//  Learning Corner for Thai
//
//  Created by MacHD on 9/25/67.
//

import Foundation
import UIKit
import GoogleSignIn
import FirebaseAuth

class SignInViewController: UIViewController {
    
    private let user = Auth.auth().currentUser
    private let googleService = GoogleService()
    
    let userName: UILabel = {
        let label = UILabel()
        label.text = "no user"
        label.backgroundColor = .gray
        label.applyHeadingFont()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signInButton: UIButton = {
        let signInButton = UIButton(type: .system)
        let backgroundImage = UIImage(systemName: "house")
        signInButton.setTitle("SignIn", for: .normal)
        
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        return signInButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("SignInViewController")
        
        userName.text = user?.displayName
        
        view.backgroundColor = .white
        
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        view.addSubview(signInButton)
        view.addSubview(userName)
        
        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            userName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userName.topAnchor.constraint(equalTo: signInButton.bottomAnchor),
            
        ])
    }
    
    @objc private func signInButtonTapped() {
        googleService.signInWithGoogle()
    }
    
}
