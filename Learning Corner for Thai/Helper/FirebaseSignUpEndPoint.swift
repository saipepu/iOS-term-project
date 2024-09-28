//
//  FirebaseSignUpEndPoint.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 28/09/2024.
//

import Foundation


class FirebaseSignUpEndPoint : NetworkingManager {
    var methodPath: String {
        return "/api/auth/signin/firebase"
    }
    
    typealias ModelType = UserResponse
    
    
    
}
