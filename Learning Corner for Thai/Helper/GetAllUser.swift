//
//  GetAllUser.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 26/09/2024.
//

import Foundation

class GetAllUser : NetworkingManager {
    
    typealias ModelType = AllUserResponse
    

    var methodPath: String {
        return "/api/user/"
    }
    
}
