//
//  GlossaryMock.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 31/08/2024.
//

import Foundation

struct GlossaryMock {
    static let instance = GlossaryMock()
    private init() {}
    
    let glossaryA = GlossaryModel(roman: "sawadee", thai: "สวัสดี", meaning: "Hello")
    let glossaryB = GlossaryModel(roman: "wan nee", thai: "วันนี้", meaning: "Today")
    let glossaryC = GlossaryModel(roman: "a lai", thai: "อะไร", meaning: "What")

    let glossaries = [
        GlossaryModel(roman: "sawadee", thai: "สวัสดี", meaning: "Hello"),
        GlossaryModel(roman: "wan nee", thai: "วันนี้", meaning: "Today"),
        GlossaryModel(roman: "a lai", thai: "อะไร", meaning: "What")
    ]

}
