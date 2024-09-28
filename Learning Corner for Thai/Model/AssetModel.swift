//
//  AssetModel.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 26/09/2024.
//



// JSON Model
/*
 "_id": "66dcb6d5d58802fb1ebc93ba",
       "name": "Asset name",
       "photo": "http://image.com",
       "point": 10,
       "createdAt": "2024-09-07T20:25:57.942Z",
       "updatedAt": "2024-09-07T20:25:57.942Z",
       "__v": 0
 */

import Foundation


struct AssetModel : Codable {
    let _id : String?
    let name : String?
    let photo : String?
    let point : Int?
}

struct AssetResponse : Codable {
    let success : Bool
    let message : [AssetModel]
}



