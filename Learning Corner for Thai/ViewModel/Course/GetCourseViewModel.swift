//
//  GetCourseViewModel.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 26/09/2024.
//

import Foundation

class GetCourseViewModel {
    
    
    private (set) var courseData: [CourseModel2]? = [] {
        didSet {
            self.onCoursesUpdate?()
        }
        
    }
     var errorMessage: String? = nil
    
    
    var onCoursesUpdate: (()->Void)?
    
    
    init() {
        
        getAllCourses()
        
    }
  

    func getAllCourses() {
        errorMessage = nil
        let getAllCourses = GetAllCourses()
        getAllCourses.execute(getMethod: "GET", token: nil) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let courseData):
                    self.courseData = courseData.message
                    print("Success getting couses \(courseData.message)")
                case .failure(let error):
                    self.errorMessage = "Failed to get user detail by id: \(error.localizedDescription)"
                    print(self.errorMessage)
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
}
