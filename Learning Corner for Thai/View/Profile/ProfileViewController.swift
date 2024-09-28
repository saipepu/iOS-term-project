//
//  ProfileViewController.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 29/08/2024.
//

import UIKit

class ProfileViewController: UIViewController {
   
    private var currentUserVM : GetUserByUserIdViewModel? = nil

    
    //MARK: - UI Components
    private let profileImage : UIImageView = {
        let profileImage = UIImageView()
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.image = UIImage(named: "cap")
        profileImage.contentMode = .scaleAspectFit
        profileImage.layer.shadowRadius = 3
        profileImage.layer.shadowOpacity = 0.75
        profileImage.layer.shadowColor = UIColor.gray.cgColor
        profileImage.layer.borderWidth = -10
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
        label.text = ""
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
        label.text = ""
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
    
    private let collectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .vertical
         layout.minimumInteritemSpacing = 12
         layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.itemSize = CGSize(width: 350, height: 200)
        
         
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collectionView.translatesAutoresizingMaskIntoConstraints = false
         return collectionView
     }()
    
    
    //MARK: - Lifecycle Methods
   
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setUpUI()
        setUpConstraints()
        currentUserVM = GetUserByUserIdViewModel()

        currentUserVM?.onUserUpdated = {
            DispatchQueue.main.async {
                if let userPoint = self.currentUserVM?.userDetail?.point, let userExp = self.currentUserVM?.userDetail?.exp {
                    self.userName.text = self.currentUserVM?.updatedUserName
                    self.pointsValueLabel.text = "\(userPoint)"
                    self.expValueLabel.text = "\(userExp)"
                    self.collectionView.reloadData()
                }
            }
           
        }
    }
  
    
    
    
    
    

    
    //MARK: -Set UpUI
    fileprivate func setUpUI(){
        //adding views to stack
        expStack.addArrangedSubview(expLabel)
        expStack.addArrangedSubview(expValueLabel)
        pointsStack.addArrangedSubview(starImageView)
        pointsStack.addArrangedSubview(pointsValueLabel)
        
        //add to sub view
        view.addSubview(profileImage)
        view.addSubview(userName)
        view.addSubview(divContainer)
        divContainer.addSubview(expStack)
        divContainer.addSubview(dividerView)
        divContainer.addSubview(pointsStack)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AssetCard.self, forCellWithReuseIdentifier: Constants.courseCellIdentifier)
        
        collectionView.reloadData()
        currentUserVM?.onUserUpdated = {
            DispatchQueue.main.async {
                self.userName.text = self.currentUserVM?.updatedUserName
            }
        }

    }
    
    fileprivate func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 24),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 200),
            profileImage.heightAnchor.constraint(equalToConstant: 200),
            
            userName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 24),
            userName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            
            //containter
            divContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            divContainer.topAnchor.constraint(equalTo: userName.bottomAnchor,constant: 24),
            divContainer.widthAnchor.constraint(equalToConstant: 250),
            divContainer.heightAnchor.constraint(equalToConstant: 60),
            
            
            
            
            expStack.topAnchor.constraint(equalTo: divContainer.topAnchor),
            expStack.leadingAnchor.constraint(equalTo: divContainer.leadingAnchor,constant: 12),
            expStack.trailingAnchor.constraint(equalTo: dividerView.leadingAnchor,constant: 12),

    
            
            // Divider
            dividerView.centerYAnchor.constraint(equalTo: divContainer.centerYAnchor),
            dividerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dividerView.widthAnchor.constraint(equalToConstant: 1),
            dividerView.heightAnchor.constraint(equalToConstant: 35),
            
            
            pointsStack.topAnchor.constraint(equalTo: divContainer.topAnchor),
            pointsStack.leadingAnchor.constraint(equalTo: dividerView.trailingAnchor,constant: 12),
            pointsStack.trailingAnchor.constraint(equalTo: divContainer.trailingAnchor,constant: -12),
            
            collectionView.topAnchor.constraint(equalTo: divContainer.bottomAnchor, constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 24),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -24),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            
            
        ])
        
    }
    
    
    
}

extension ProfileViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentUserVM?.userDetail?.assets?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.courseCellIdentifier, for: indexPath) as! AssetCard
        
        guard let assets = currentUserVM?.userDetail?.assets else { return cell }
        print("Assets\(assets)")
        
        cell.configure(asset: assets[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 500, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
      
        let alertController = UIAlertController(title: "Equip", message: "Do you wanna quip this item?", preferredStyle: .alert)
        
        // Confirm action that triggers another function
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { _ in
            
            if let asset = self.currentUserVM?.userDetail?.assets?[indexPath.row].photo {
                self.profileImage.image = UIImage(named: asset)
                print("Profile set upped")
            }
        }
        
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alertController.addAction(confirmAction)
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
        
        
    }
    
    
}
