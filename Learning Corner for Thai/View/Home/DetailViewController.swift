//
//  DetailViewController.swift
//  Learning Corner for Thai
//
//  Created by MacHD on 9/24/67.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Variables
    //replace with fetched data from API
//    private let detailView = DetailView()
    
    
  

    
    override func loadView() {
        self.view = DetailView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpUI()
       
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Set Up UI
    fileprivate func setUpUI() {

        
//        contentView.addSubview(detailView)
        

    }
    
//    fileprivate func setUpConstraints() {
//        
//        NSLayoutConstraint.activate([
//            // Scroll View Constraints
//            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            scrollView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor),
//            
//            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            contentView.trailingAnchor.constraint(equalTo:
//                scrollView.trailingAnchor),
//            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            
//        ])
//        
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
