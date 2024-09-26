//
//  GetUserById.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 26/09/2024.
//

import Foundation

class GetUserById : NetworkingManager {
  
    var id: String
    typealias ModelType = UserResponse
    
    init(id: String) {
        self.id = id
    }

    var methodPath: String {
        return "/api/user/\(id)"
    }
    
    
    
}
