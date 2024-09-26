//
//  ReusableButton.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 26/09/2024.
//

import Foundation
import UIKit

func createReusableButton(buttonTitle: String, buttonAction: @escaping () -> Void) -> UIButton {
    let button = UIButton(type: .system)
    
    // Set the button title
    button.setTitle(buttonTitle, for: .normal)
    
    // Set the button title color and font
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    
    // Set the button background color
    button.backgroundColor = .white
    
    // Set the button frame width and height
    
    // Set rounded corners
    button.layer.cornerRadius = 10
    button.layer.masksToBounds = true
    
    // Add a border
    button.layer.borderWidth = 2
    button.layer.borderColor = UIColor.systemBlue.cgColor
    
    // Add a shadow to create a 3D effect
    button.layer.shadowColor = UIColor.systemBlue.cgColor
    button.layer.shadowOffset = CGSize(width: 0, height: 5)
    button.layer.shadowOpacity = 0.5
    button.layer.shadowRadius = 5
    button.layer.masksToBounds = false

    // Add action to the button
    button.addAction(UIAction(handler: { _ in
        buttonAction()
    }), for: .touchUpInside)
    
    return button
}

