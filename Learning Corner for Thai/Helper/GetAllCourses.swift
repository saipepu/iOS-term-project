//
//  GetAllCourses.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 26/09/2024.
//

import Foundation

class GetAllCourses : NetworkingManager {
    typealias ModelType = CourseResponse
    
    var methodPath: String {
        return "/api/course"
    }
    
    
}
