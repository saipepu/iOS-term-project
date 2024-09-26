//
//  RewardViewController.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 26/09/2024.
//

import UIKit

class RewardViewController: UIViewController {

    //MARK: - Variables
//    var courseVM = GetCourseViewModel()
    
    //MARK: - UI Components
    
    private let congratsLabel : UILabel = {
        let label = UILabel()
        label.applyHeadingFont()
        label.applyPrimaryLabelColor()
        label.text = "Congratulations!\n   You just earn"
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textAlignment = .left
        return label
    }()
    
    
    private let divContainer : UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private let experienceLabel : UILabel = {
        let label = UILabel()
        label.applyHeadingFont()
        label.applyPrimaryLabelColor()
        label.text = "25 Exp"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    

    private let pointsLabel : UILabel = {
        let label = UILabel()
        label.applyHeadingFont()
        label.applyPrimaryLabelColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.text = "5 Points"
        label.textAlignment = .left
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
      setUpConstraints()
    }
    
    fileprivate func setUpUI(){
        view.addSubview(divContainer)
        divContainer.addSubview(congratsLabel)
        divContainer.addSubview(experienceLabel)
        divContainer.addSubview(pointsLabel)
    }

    fileprivate func setUpConstraints() {
        
        NSLayoutConstraint.activate([
        
            divContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            divContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            divContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0),
            divContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
        
            
            congratsLabel.topAnchor.constraint(equalTo: divContainer.topAnchor, constant: 8),
            congratsLabel.centerXAnchor.constraint(equalTo: divContainer.centerXAnchor),
            
            experienceLabel.topAnchor.constraint(equalTo: congratsLabel.bottomAnchor, constant: 24),
            experienceLabel.leadingAnchor.constraint(equalTo: divContainer.leadingAnchor,constant: 24),
            
            pointsLabel.topAnchor.constraint(equalTo: congratsLabel.bottomAnchor, constant: 24),
            pointsLabel.trailingAnchor.constraint(equalTo: divContainer.trailingAnchor,constant: -24),
        
        
        ])
        
    }
 
    
}
