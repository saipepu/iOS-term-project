//
//  CreateUserDTO.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 28/09/2024.
//

import Foundation

struct SignUpDTO : Codable {
    let name : String
    let email : String
    let firebaseId : String
}
