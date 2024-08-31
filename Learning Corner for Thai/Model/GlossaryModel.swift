//
//  GlossaryModel.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 31/08/2024.
//

import Foundation

struct GlossaryModel : Codable,Identifiable {
    var id = UUID().uuidString
    let roman : String
    let thai : String
    let meaning : String
}
