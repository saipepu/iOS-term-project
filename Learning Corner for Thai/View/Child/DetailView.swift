//
//  DetailView.swift
//  Learning Corner for Thai
//
//  Created by MacHD on 9/24/67.
//

import UIKit

class DetailView: UIView {

    //MARK: - Variables
    private let course = CourseMock.instance.courseA

    
    //MARK: UI components
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let courseTitle: UILabel = {
        let label = UILabel()
        label.text = "Course Name"
        label.backgroundColor = .gray
        label.applyHeadingFont()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    
    
    //MARK: - Lifecycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(courseTitle)
      
        NSLayoutConstraint.activate([
         
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor),
            
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo:
                scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            courseTitle.topAnchor.constraint(equalTo: topAnchor,constant: 20)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    
    
    //MARK: - UI Set Up
    fileprivate func setUpUI() {
       
    }
    
    
    
    
    
    //MARK: - Set Constaints

}
