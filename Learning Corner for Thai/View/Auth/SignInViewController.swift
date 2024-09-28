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
    
    let welcomeText: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Learning Corner"
        label.textColor = UIColor(named: Theme.tint)
        label.textColor = .blue
        label.applyHeadingFont()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let descriptionText: UILabel = {
        let label = UILabel()
        label.text = "Feel like a local in Thailand"
        label.applyPrimaryLabelColor()
        label.applyLabelFont()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let onboardingImage : UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.onboarding)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let signInButton: UIButton = {
        let signInButton = UIButton(type: .system)

        // Ensure Auto Layout is enabled
        signInButton.translatesAutoresizingMaskIntoConstraints = false

        return signInButton
    }()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSignInButton()
        print("SignInViewController")
        
        
        view.backgroundColor = .white
        
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        view.addSubview(onboardingImage)
        
        view.addSubview(welcomeText)
        
        view.addSubview(descriptionText)
        
        view.addSubview(signInButton)

        
        NSLayoutConstraint.activate([
            onboardingImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardingImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 164),
            onboardingImage.heightAnchor.constraint(equalToConstant: 369),
            
            welcomeText.topAnchor.constraint(equalTo: onboardingImage.bottomAnchor, constant: 32),
            welcomeText.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            descriptionText.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 8),
            descriptionText.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            signInButton.topAnchor.constraint(equalTo: descriptionText.bottomAnchor,constant: 32),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            signInButton.widthAnchor.constraint(equalToConstant: 342)
        ])
    }
    
    @objc private func signInButtonTapped() {
        googleService.signInWithGoogle()
    }
 
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let resizedImage = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
        return resizedImage
    }


    func configureSignInButton() {
        // Create a UIButton configuration
        var configuration = UIButton.Configuration.plain()
        
        // Set title and title text properties
        configuration.title = "Get Started"
        configuration.baseForegroundColor = .systemBlue
        
        // Resize the image manually
        if let googleIcon = UIImage(named: "google_icon") {
            let resizedIcon = resizeImage(image: googleIcon, targetSize: CGSize(width: 25, height: 25))
            configuration.image = resizedIcon
        }

        // Adjust positioning: image placement and padding
        configuration.imagePadding = 10
        configuration.imagePlacement = .leading 
        
        // Apply the configuration to the button
        signInButton.configuration = configuration
        
        // Add border
        signInButton.layer.borderWidth = 2
        signInButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        // Set rounded corners
        signInButton.layer.cornerRadius = 10
    }
}
