//
//  PurchaseAssets.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 28/09/2024.
//

import Foundation
class PurchaseAssets : NetworkingManager {
    
    var id : String
    init(id: String) {
        self.id = id
    }
    
    typealias ModelType = AssetResponse
    
    var methodPath: String {
        return "/api/user/\(id)/buy"
    }
    
}
