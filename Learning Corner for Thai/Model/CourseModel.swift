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


struct CourseResponse : Codable {
    let success : Bool
    let message : [CourseModel2]
}


struct CourseModel2: Codable {
    let _id: String?
    let title: String?
    let description: String?
    let youtubeLink : String?
    let photo: String?
    let exp: Int?
    let difficulty: String?
    let quizzes: [QuizModel]?
    let script: [ScriptModel]?
    
   
}


