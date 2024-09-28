//
//  RewardViewController.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 26/09/2024.
//

import UIKit


protocol RewardViewControllerDelegate: AnyObject {
    func didDismissRewardViewController()
}

class RewardViewController: UIViewController {

    //MARK: - Variables
    private var exp : Int = 0
    private var points : Int = 0
    var homeButton : UIButton!
    weak var delegate: RewardViewControllerDelegate?
    
    //MARK: - UI Components
    
    private let congratsLabel : UILabel = {
        let label = UILabel()
        label.applyHeadingFont()
        label.applyPrimaryLabelColor()
        label.text = "Congratulations!\n     You just earn"
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
    
    
    private let expContainer : UIImageView = {
       let imageContainer = UIImageView()
        imageContainer.image = UIImage(named: Constants.rewardContainer)
        imageContainer.contentMode = .scaleAspectFit
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        return imageContainer
    }()
    
    private let experienceLabel : UILabel = {
        let label = UILabel()
        label.applyLabelFont()
        label.textColor = UIColor.white
        label.text = "25 Exp"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    

    private let pointsContainer : UIImageView = {
       let imageContainer = UIImageView()
        imageContainer.image = UIImage(named: Constants.rewardContainer)
        imageContainer.contentMode = .scaleAspectFit
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        return imageContainer
    }()
    
    private let pointsLabel : UILabel = {
        let label = UILabel()
        label.applyLabelFont()
        label.applyPrimaryLabelColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.text = "5 Points"
        label.textAlignment = .left
        return label
    }()
    
    
    public func configure(exp : Int, points : Int){
        self.exp = exp
        self.points = points
        experienceLabel.text = "\(exp) EXP"
        pointsLabel.text = "\(points) Points"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
      setUpConstraints()
    }
    
    fileprivate func setUpUI(){
        view.addSubview(divContainer)
        divContainer.addSubview(congratsLabel)
        divContainer.addSubview(expContainer)
        expContainer.addSubview(experienceLabel)
        divContainer.addSubview(pointsContainer)
        pointsContainer.addSubview(pointsLabel)
        
        homeButton = createReusableButton(buttonTitle: "Home", buttonAction: {
      
            self.dismiss(animated: true, completion: nil)
            self.delegate?.didDismissRewardViewController()
        })
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeButton)

        
        
    }

    fileprivate func setUpConstraints() {
        
        NSLayoutConstraint.activate([
        
            divContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            divContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            divContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0),
            divContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
        
            
            congratsLabel.centerXAnchor.constraint(equalTo: divContainer.centerXAnchor),
            congratsLabel.topAnchor.constraint(equalTo: divContainer.topAnchor, constant: 30),
            
            expContainer.topAnchor.constraint(equalTo: congratsLabel.bottomAnchor, constant: 24),
            expContainer.leadingAnchor.constraint(equalTo: divContainer.leadingAnchor,constant: 12),
            
            pointsContainer.topAnchor.constraint(equalTo: congratsLabel.bottomAnchor, constant: 24
                                                ),
            pointsContainer.trailingAnchor.constraint(equalTo: divContainer.trailingAnchor,constant: -12),
            
            experienceLabel.centerXAnchor.constraint(equalTo: expContainer.centerXAnchor),
            experienceLabel.centerYAnchor.constraint(equalTo: expContainer.centerYAnchor) ,

          
        
            pointsLabel.centerXAnchor.constraint(equalTo: pointsContainer.centerXAnchor),
            pointsLabel.centerYAnchor.constraint(equalTo: pointsContainer.centerYAnchor) ,
            
            homeButton.topAnchor.constraint(equalTo: divContainer.bottomAnchor),
            homeButton.widthAnchor.constraint(equalToConstant: 145),
            homeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
 
    
}
