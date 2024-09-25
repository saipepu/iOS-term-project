//
//  LeaderboardCell.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 30/08/2024.
//

import UIKit

class LeaderboardCell: UITableViewCell {
    
    //MARK: - UI Components
    private var indexPath : IndexPath?
    private (set) var leaderboardStats : LeaderboardModel?

    
    //MARK: - UI Components
    
    private var profileImageView : UIImageView = {
      let profileImage = UIImageView()
        profileImage.contentMode = .scaleAspectFit
        profileImage.image = UIImage(systemName: "questionmark")
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = profileImage.bounds.height / 2
        return profileImage
    }()
    
    private let userName : UILabel = {
        let userName = UILabel()
        userName.applyLabelFont()
        userName.applyPrimaryLabelColor()
        userName.numberOfLines = 1
        userName.lineBreakMode = .byTruncatingTail
        return userName
    }()
    
    private let starImage : UIImageView = {
        let starImage = UIImageView()
        starImage.contentMode = .scaleAspectFit
        starImage.image = UIImage(systemName: "star.fill")
        starImage.tintColor = .systemBlue
        return starImage
    }()
    
    
    private let scoreLabel : UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.applyLabelFont()
        scoreLabel.applyPrimaryLabelColor()
        scoreLabel.numberOfLines = 1
        scoreLabel.lineBreakMode = .byTruncatingTail
        return scoreLabel
    }()
    
    
    //MARK: - Lifecycle Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
        self.selectionStyle = .none
        self.contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Data Receiver from Parent View
    public func configure(at indexPath:IndexPath, leaderboardStats : LeaderboardModel) {
        self.indexPath = indexPath
        self.leaderboardStats = leaderboardStats
        //injecting model instance
        self.profileImageView = UIImageView(image: UIImage(named: leaderboardStats.profileImage))
        self.userName.text = leaderboardStats.name
        self.scoreLabel.text = "\(leaderboardStats.score)"
    }
    
    
    
    //MARK: -Set Up UI
    fileprivate func setUpUI() {
        let nameHStack = UIStackView(arrangedSubviews: [profileImageView,userName])
        nameHStack.axis = .horizontal
        nameHStack.distribution = .fill
        nameHStack.spacing = 16
        nameHStack.alignment = .center
        nameHStack.translatesAutoresizingMaskIntoConstraints = false
        
        
        let scoreHStack = UIStackView(arrangedSubviews: [starImage,scoreLabel])
        scoreHStack.axis = .horizontal
        scoreHStack.distribution = .fill
        scoreHStack.spacing = 16
        scoreHStack.alignment = .center
        scoreHStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nameHStack)
        addSubview(scoreHStack)
        // Constraints Set Up
        NSLayoutConstraint.activate([
            nameHStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            scoreHStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameHStack.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 32),
            scoreHStack.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor,constant: -21)
            
            
            
//            userName.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 12),
//            scoreLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
//            starImage.trailingAnchor.constraint(equalTo: scoreLabel.leadingAnchor),
            
        ])
    }
    
}

