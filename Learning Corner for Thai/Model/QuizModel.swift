//
//  QuizModel.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 24/09/2024.
//

import Foundation

struct QuizModel : Codable {
    let _id : String?
    let question : String?
    let photo : String?
    let options : [OptionModel]?
    let point : Int?
}
