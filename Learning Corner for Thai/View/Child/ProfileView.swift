//
//  ProfileView.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 26/09/2024.
//

import UIKit

class ProfileView: UIView {
    
    
    //MARK: - UI Components
    private let profileImage : UIImageView = {
        let profileImage = UIImageView()
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.image = UIImage(named: "profile_1")
        profileImage.contentMode = .scaleAspectFit
        profileImage.layer.shadowRadius = 3
        profileImage.layer.shadowOpacity = 0.75
        profileImage.layer.shadowColor = UIColor.gray.cgColor
        profileImage.layer.borderWidth = 10
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.cornerRadius = 30
        return profileImage
    }()
    
    private let userName : UILabel = {
        let userName = UILabel()
        userName.applyHeadingFont()
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.text = "Username"
        userName.textAlignment = .center
        return userName
    }()
    
    
    private let divContainer : UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    
    private let expLabel: UILabel = {
        let label = UILabel()
        label.text = "Exp"
        label.applyBodyFont()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let expValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1,256"
        label.applyHeadingFont()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
   
    
    private let pointsValueLabel: UILabel = {
        let label = UILabel()
        label.text = "300"
        label.applyHeadingFont()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let expStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    private let pointsStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    //MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: -Set UpUI
    fileprivate func setUpUI(){
        //adding views to stack
        expStack.addArrangedSubview(expLabel)
        expStack.addArrangedSubview(expValueLabel)
        pointsStack.addArrangedSubview(starImageView)
        pointsStack.addArrangedSubview(pointsValueLabel)
        
        //add to sub view
        addSubview(profileImage)
        addSubview(userName)
        addSubview(divContainer)
        divContainer.addSubview(expStack)
        divContainer.addSubview(dividerView)
        divContainer.addSubview(pointsStack)

    }
    
    fileprivate func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 24),
            profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 150),
            profileImage.heightAnchor.constraint(equalToConstant: 150),
            
            userName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 24),
            userName.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            
            //containter
            divContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            divContainer.topAnchor.constraint(equalTo: userName.bottomAnchor,constant: 24),
            divContainer.widthAnchor.constraint(equalToConstant: 250),
            divContainer.heightAnchor.constraint(equalToConstant: 60),
            
            
            
            
            expStack.topAnchor.constraint(equalTo: divContainer.topAnchor),
            expStack.leadingAnchor.constraint(equalTo: divContainer.leadingAnchor,constant: 12),
            expStack.trailingAnchor.constraint(equalTo: dividerView.leadingAnchor,constant: 12),

    
            
            // Divider
            dividerView.centerYAnchor.constraint(equalTo: divContainer.centerYAnchor),
            dividerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            dividerView.widthAnchor.constraint(equalToConstant: 1),
            dividerView.heightAnchor.constraint(equalToConstant: 35),
            
            
            pointsStack.topAnchor.constraint(equalTo: divContainer.topAnchor),
            pointsStack.leadingAnchor.constraint(equalTo: dividerView.trailingAnchor,constant: 12),
            pointsStack.trailingAnchor.constraint(equalTo: divContainer.trailingAnchor,constant: -12)
            
            
        ])
        
    }
    
    
    
}
