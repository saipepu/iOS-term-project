//
//  UpdateScoreEndPoint.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 27/09/2024.
//

import Foundation

class UpdateScoreEndPoint : NetworkingManager {
    typealias ModelType = UpdateScoreDTO
        var userId: String
        
        init(userId: String){
            self.userId = userId
        }
        
        var methodPath: String {
            return "/api/user/\(userId)/score"
        }
}
