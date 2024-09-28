//
//  CourseCell.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 31/08/2024.
//

import UIKit

class CourseCell:  UICollectionViewCell {
    
    //MARK: - Variables
    private (set) var course : CourseModel2?

    
    //MARK: - UI Components
    private var courseImageView : UIImageView = {
       let courseImageView = UIImageView()
        courseImageView.clipsToBounds = true
        courseImageView.layer.cornerRadius = 15
        courseImageView.image = UIImage(named: Constants.buyAtStoreImage)
        return courseImageView
    }()
    
    private var courseName : UILabel = {
       let courseName = UILabel()
        courseName.applyLabelFont()
        courseName.applyPrimaryLabelColor()
        courseName.numberOfLines = 2
        courseName.lineBreakMode = .byTruncatingTail
        courseName.text = "Buying at 7/11 for the first time "
        return courseName
    }()
    
    private var coursePoint : UILabel = {
        let coursePoint = UILabel()
        coursePoint.applyBodyFont()
        coursePoint.applySecondaryLabelColor()
        coursePoint.text = "12 Coins"
        coursePoint.numberOfLines = 1
        return coursePoint
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
        setUpUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Data Receiver from Parent View
    public func configure(course : CourseModel2) {
        self.course = course
        //injecting model instance
        if let coursePhoto = course.photo, let courseExp = course.exp {
            self.courseImageView.image = UIImage(named: coursePhoto)
            self.courseName.text = course.title
        
            self.coursePoint.text = "\(courseExp) XP"
            //        self.courseImageView.image = UIImage(named: course.courseImage)
            //        self.courseName.text = course.courseName
            //        self.coursePoint.text = "\(course.coursePoints) XP"
        }
    }
    
    
    
    //MARK: - UI Set Up
    fileprivate func setUpUI() {
        
        
        
        let vStack = UIStackView(arrangedSubviews: [courseImageView,courseName,coursePoint])
        vStack.axis = .vertical
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(vStack)
        
        NSLayoutConstraint.activate([
        
            vStack.topAnchor.constraint(equalTo: topAnchor,constant: 8),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            courseImageView.widthAnchor.constraint(equalToConstant: 164),
            courseImageView.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    
    fileprivate func setUpConstraints() {
        
    }
}
