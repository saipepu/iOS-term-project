//
//  AssetShopViewController.swift
//  Learning Corner for Thai
//
//  Created by MacHD on 9/27/67.
//

import UIKit
import Combine
import KeychainSwift

class AssetShopViewController: UIViewController {
    
    //MARK: - Variables
    private let assetsVM : GetAllAssetViewModel
    private var purchaseAssets : PurchaseAssetViewModel? = nil
    var keyChain = KeychainSwift()
    
    //MARK: - UI Components
//    private let searchBar = ReusableSearchBar()
    private let courseCell = CourseCell()
    private let googleService = GoogleService()
    
    // WELCOME TEXT
    private let welcomeText: UILabel = {
        let label = UILabel()
        label.applyHeadingFont()
        label.applyPrimaryLabelColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.text = "Premium Assets"
        label.textAlignment = .left
        return label
    }()
    
    // SCROLL VIEW
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // CONTENT VIEW
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    // COLLECTION VIEW
    private let collectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .vertical
         layout.minimumInteritemSpacing = 12
         layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.itemSize = CGSize(width: 350, height: 200)
        
         
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collectionView.translatesAutoresizingMaskIntoConstraints = false
         collectionView.showsHorizontalScrollIndicator = false
        
         return collectionView
     }()
    
    
    //MARK: - Lifecycle Methods
    init(assetsVM: GetAllAssetViewModel) {
        self.assetsVM = assetsVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has bot been implemented")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }

    //MARK: - VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        print("AssetShopViewController loaded")
        
        print(assetsVM, "asset Collection")
        
        if let asset = assetsVM.assetData {
            print(asset.count, "asset count")
        }
        
        view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AssetCard.self, forCellWithReuseIdentifier: Constants.courseCellIdentifier)
        
        collectionView.reloadData()
        setUpUI()
        setUpConstraints()

    }
    
    //MARK: - Set Up UI
    fileprivate func setUpUI() {
//        searchBar.translatesAutoresizingMaskIntoConstraints = false
        welcomeText.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(welcomeText)
//        contentView.addSubview(searchBar)
        contentView.addSubview(collectionView)
        view.layoutIfNeeded()
    }
    
    //MARK: - Set Up Constraints
    fileprivate func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor),
            
            welcomeText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            welcomeText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            welcomeText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            welcomeText.heightAnchor.constraint(equalToConstant: 20),
            
//            searchBar.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 20),
//            searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
//            searchBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
//            searchBar.heightAnchor.constraint(equalToConstant: 65),
            
            collectionView.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
            
            collectionView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
            
        ])
        
    }
    
    
    func showConfirmationAlert(title: String, message: String) {
       
    }

    // Function triggered when "Confirm" is clicked
    func postAssetById() {
     
      
    }

}

extension AssetShopViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return assetsVM.assetData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.courseCellIdentifier, for: indexPath) as! AssetCard
        
        guard let assets = assetsVM.assetData else { return cell }
        cell.configure(asset: assets[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 500, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "Purchase", message: "Do you wanna purchase this item?", preferredStyle: .alert)
        
        // Confirm action that triggers another function
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { _ in
            if let selectedAssetId = self.assetsVM.assetData?[indexPath.row]._id {
                self.purchaseAssets = PurchaseAssetViewModel(assetId: selectedAssetId)
                if let id = self.keyChain.get("userId") {
                    
                    self.purchaseAssets?.buyItem(userId: id)
                }
            }
            
            
        }
        
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alertController.addAction(confirmAction)
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
        
        
    }
    
}

/*
 private func updateUserDetail() {
     guard let updateScoreVM = updateScoreVM else {
          print("ViewModel not initialized.")
          return
      }
      
      // Update ViewModel properties
      updateScoreVM.exp = courseExp
      updateScoreVM.point = finalScore
      
      // Pass user ID for the update
     updateScoreVM.updateScore(userId: "66f6c1ef2020385fb9a862fc")
      
      print("User updated")
 }
 
 */
