//
//  UserModel.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 26/09/2024.
//

import Foundation


struct UserResponse : Codable {
    let success : Bool
    let message : UserModel
}

struct AllUserResponse : Codable {
    let success : Bool
    let message : [UserModel]
}

struct UserModel : Codable {
    let _id : String?
    let name : String?
    let email : String?
    let password : String?
    let point : Int?
    let number : Int?
    let courses : [CourseModel]?
    let assets : [AssetModel]?
}
