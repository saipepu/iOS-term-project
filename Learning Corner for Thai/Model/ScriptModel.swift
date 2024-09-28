//
//  ScriptModel.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 26/09/2024.
//

import Foundation

// MARK: - Script Model
struct ScriptModel: Codable {
    let speaker: String
    let content: ContentModel
    let audioFile: String
    let _id: String
    let words: [Word]
}

// MARK: - Word Model
struct Word: Codable {
    
}

struct ContentModel : Codable {
    
    let English : String
    let Roman : String
    let Thai : String
    
    
}
