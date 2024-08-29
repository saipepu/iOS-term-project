//
//  HomeViewController.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 29/08/2024.
//

import UIKit

class HomeViewController: UIViewController {

    
    private var label : UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.applyHeadingFont()
        return label
    }()
    
    private var label2 : UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.applyBodyFont()
        return label
    }()
    
    
    
    private var label3 : UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.applyBodyFont()
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(label)
        view.addSubview(label2)
        view.addSubview(label3)
        label.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12).isActive = true
        label2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        label3.topAnchor.constraint(equalTo: label2.bottomAnchor , constant: 12).isActive = true
        label3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
