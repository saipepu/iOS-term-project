//
//  AssetCard.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 31/08/2024.
//

import UIKit

class AssetCard:  UICollectionViewCell {
    
    //MARK: - Variables
    private (set) var asset : AssetModel?

    
    //MARK: - UI Components
    private var assetImageView : UIImageView = {
       let assetImageView = UIImageView()
        assetImageView.clipsToBounds = true
        assetImageView.layer.cornerRadius = 15
        assetImageView.image = UIImage(named: Constants.buyAtStoreImage)
        assetImageView.contentMode = .scaleAspectFit
        assetImageView.backgroundColor = .white
        return assetImageView
    }()
    
    private var assetName : UILabel = {
       let assetName = UILabel()
        assetName.applyLabelFont()
        assetName.applyPrimaryLabelColor()
        assetName.numberOfLines = 2
        assetName.lineBreakMode = .byTruncatingTail
        assetName.text = "Buying at 7/11 for the first time "
        return assetName
    }()
    
    private var assetPoint : UILabel = {
        let assetPoint = UILabel()
        assetPoint.applyBodyFont()
        assetPoint.applySecondaryLabelColor()
        assetPoint.text = "12 Coins"
        assetPoint.numberOfLines = 1
        return assetPoint
    }()
    
    private var buyButtom: UIButton = {
        let buyButton = UIButton()
        buyButton.setTitle("Buy Item", for: .normal)
        buyButton.setTitleColor(UIColor.black, for: .normal)
        buyButton.layer.cornerRadius = 5
        buyButton.addTarget(self, action: #selector(handleBuy), for: .touchUpInside)
        
        return buyButton
        
    }()
    
    
    //MARK: - Lifecycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.black.cgColor // Shadow color
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 1) // Offset of the shadow
        layer.shadowRadius = 4
        
        backgroundColor = .white
        setUpGradientBackground()
        setUpUI()
        
    }
    
    private func setUpGradientBackground() {
        // Create the gradient layer
        let gradientLayer = CAGradientLayer()
        
        // Define colors (you can change these colors to your preference)
        gradientLayer.colors = [
            #colorLiteral(red: 0.864588201, green: 0.8820744157, blue: 0.6975327134, alpha: 1).cgColor,
            #colorLiteral(red: 0.9884477258, green: 0.9127836823, blue: 0.8975811601, alpha: 1).cgColor,
        ]
        
        // Set the gradient direction (top to bottom, left to right, etc.)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) // Diagonal gradient (left top to right bottom)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        gradientLayer.mask = shapeLayer
        
        // Set the frame to match the cell’s bounds
        gradientLayer.frame = bounds
        
        // Add the gradient layer to the cell’s layer
        layer.insertSublayer(gradientLayer, at: 0) // Insert at the back, behind other content
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Data Receiver from Parent View
    public func configure(asset : AssetModel) {
        self.asset = asset
        print(asset.photo!)
        //injecting model instance
        self.assetImageView.image = UIImage(named: asset.photo!)
        self.assetName.text = asset.name
        self.assetPoint.text = "\(asset.point!) Point"
//        self.assetImageView.image = UIImage(named: course.courseImage)
//        self.assetName.text = course.assetName
//        self.assetPoint.text = "\(course.assetPoints) XP"
    }
    
    
    
    //MARK: - UI Set Up
    fileprivate func setUpUI() {
        
        
        
        let vStack = UIStackView(arrangedSubviews: [assetImageView,assetName,assetPoint, buyButtom])
        vStack.axis = .vertical
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.spacing = 2
        
        addSubview(vStack)
        
        NSLayoutConstraint.activate([
        
            vStack.topAnchor.constraint(equalTo: topAnchor,constant: 8),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            assetImageView.widthAnchor.constraint(equalToConstant: 164),
            assetImageView.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    
    fileprivate func setUpConstraints() {
        
    }
    
    @objc private func handleBuy() {
       

        
        
    }
    
    
  

    
    
}
