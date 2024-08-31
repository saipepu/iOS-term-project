//
//  CourseModel.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 31/08/2024.
//

import Foundation

struct CourseModel : Codable,Identifiable {
    var id = UUID().uuidString
    let courseImage : String
    let courseName : String
    let courseDescription : String
    let coursePoints : Int
    let courseVideo : String
    let glossaries : [GlossaryModel]    
}


