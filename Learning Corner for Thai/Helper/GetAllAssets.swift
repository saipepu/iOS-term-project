//
//  GetAllAssets.swift
//  Learning Corner for Thai
//
//  Created by MacHD on 9/27/67.
//

import Foundation

class GetAllAssets : NetworkingManager {
    typealias ModelType = AssetResponse
    
    var methodPath: String {
        return "/api/asset"
    }
    
}
