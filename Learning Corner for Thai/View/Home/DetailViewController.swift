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
    
  
    private var course : CourseModel2?
    private var detailView: DetailView!
    
    override func loadView() {
        detailView = DetailView()
        self.view = detailView
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpUI()
        if let course = course {
                  detailView.passData(course: course)  
                  print("Data passed to detail child")
              }
       
    }
    

    

    
    
    //MARK: - Data Injection
    public func configure(course : CourseModel2) {
        self.course = course
        print("Data got from Detail View Config Func")
    }
    
    
    //MARK: - Set Up UI
    fileprivate func setUpUI() {
       let navigationButton =  createReusableButton(buttonTitle: "Take Quiz") {
            self.navigateToQuiz()
        }
         
        
        view.addSubview(navigationButton)
        navigationButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            navigationButton.topAnchor.constraint(equalTo: detailView.courseDescription.bottomAnchor, constant: 24),
            navigationButton.centerXAnchor.constraint(equalTo: detailView.contentView.centerXAnchor),
            navigationButton.heightAnchor.constraint(equalToConstant: 40),
            navigationButton.widthAnchor.constraint(equalToConstant: 200),
            navigationButton.bottomAnchor.constraint(equalTo: detailView.contentView.bottomAnchor, constant: -24)
        
        ])

    }
    
    
    
    fileprivate func navigateToQuiz() {
        let quizVC = QuizViewController()
        if let quizzes = course?.quizzes, let course = course {
            quizVC.configure(quizzez: quizzes, course: course)
            navigationController?.pushViewController(quizVC, animated: true)
        }
    }
    



}
