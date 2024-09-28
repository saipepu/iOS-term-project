//
//  LeaderboardModel.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 30/08/2024.
//

import Foundation

struct LeaderboardModel : Codable,Identifiable {
    var id = UUID().uuidString
    let profileImage : String
    let name : String
    let score : Int
}
