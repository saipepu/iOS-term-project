//
//  OptionMock.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 24/09/2024.
//

import Foundation

struct OptionMock {
    static let shared = OptionMock()
    private init() {}
    
    
    let optionA = OptionModel(_id: "1", content: "Paris", isCorrect: true, photo: "paris_option.jpg")
    
    let optionB = OptionModel(_id: "2", content: "London", isCorrect: false, photo: "london_option.jpg")

    
    let optionC = OptionModel(_id: "3", content: "Berlin", isCorrect: false, photo: "berlin_option.jpg")

    
    let optionD = OptionModel(_id: "4", content: "Madrid", isCorrect: false, photo: "madrid_option.jpg")

    
    
    let options = [
        OptionModel(_id: "1", content: "Paris", isCorrect: true, photo: "paris_option.jpg"),
        OptionModel(_id: "2", content: "London", isCorrect: false, photo: "london_option.jpg"),
        OptionModel(_id: "3", content: "Berlin", isCorrect: false, photo: "berlin_option.jpg"),
        OptionModel(_id: "4", content: "Madrid", isCorrect: false, photo: "madrid_option.jpg")
    ]
    
}
