//
//  UpdateUserEndPoint.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 28/09/2024.
//

import Foundation
class UpdateUserEndPoint : NetworkingManager {
    typealias ModelType = UserModel
        var userId: String
        
        init(userId: String){
            self.userId = userId
        }
        
        var methodPath: String {
            return "/api/user/\(userId)"
        }
}
