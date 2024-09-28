//
//  CourseMock.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 31/08/2024.
//

import Foundation

struct CourseMock {
    static let instance = CourseMock()
    private init() {}
    
    let courseA = CourseModel(courseImage: Constants.buyAtStoreImage, courseName: "Buying at 7/11", courseDescription: "In this lesson, you'll learn everything you need to know about having conversations when buying items at 7/11. The video will guide you through typical phrases, vocabulary, and cultural tips for shopping at convenience stores in Thailand. You'll also have access to glossaries that cover essential words and expressions, helping you navigate your next 7/11 experience with confidence.", coursePoints: 13, courseVideo: "", glossaries: GlossaryMock.instance.glossaries)
    let courseB = CourseModel(courseImage: Constants.askDirectionImage, courseName: "Asking for directions", courseDescription: "In this lesson, you'll master the essential phrases and vocabulary for asking for directions in Thailand. The video will walk you through common scenarios, such as finding your way to a destination, understanding street signs, and interpreting responses from locals. Along with practical language tips, you'll have access to glossaries that break down key words and expressions, ensuring you're prepared to confidently ask for directions and navigate the streets of Thailand.", coursePoints: 21, courseVideo: "", glossaries: GlossaryMock.instance.glossaries)
    let courseC = CourseModel(courseImage: Constants.makeFriendsImage, courseName: "Making Friends", courseDescription: "In this lesson, you'll explore the language and cultural tips for making new friends in Thailand. The video will guide you through common conversation starters, how to introduce yourself, and polite ways to engage with others in social settings. You'll also have access to glossaries that highlight essential phrases and expressions, helping you build connections and form friendships with ease as you navigate Thai culture.", coursePoints: 21, courseVideo: "", glossaries: GlossaryMock.instance.glossaries)

    let courses = [
        CourseModel(courseImage: Constants.buyAtStoreImage, courseName: "Buying at 7/11", courseDescription: "In this lesson, you'll learn everything you need to know about having conversations when buying items at 7/11. The video will guide you through typical phrases, vocabulary, and cultural tips for shopping at convenience stores in Thailand. You'll also have access to glossaries that cover essential words and expressions, helping you navigate your next 7/11 experience with confidence.", coursePoints: 13, courseVideo: "", glossaries: GlossaryMock.instance.glossaries),
        CourseModel(courseImage: Constants.askDirectionImage, courseName: "Asking for directions", courseDescription: "In this lesson, you'll master the essential phrases and vocabulary for asking for directions in Thailand. The video will walk you through common scenarios, such as finding your way to a destination, understanding street signs, and interpreting responses from locals. Along with practical language tips, you'll have access to glossaries that break down key words and expressions, ensuring you're prepared to confidently ask for directions and navigate the streets of Thailand.", coursePoints: 21, courseVideo: Constants.makeFriendsImage, glossaries: GlossaryMock.instance.glossaries),
        CourseModel(courseImage: Constants.makeFriendsImage, courseName: "Making Friends", courseDescription: "In this lesson, you'll explore the language and cultural tips for making new friends in Thailand. The video will guide you through common conversation starters, how to introduce yourself, and polite ways to engage with others in social settings. You'll also have access to glossaries that highlight essential phrases and expressions, helping you build connections and form friendships with ease as you navigate Thai culture.", coursePoints: 21, courseVideo: "", glossaries: GlossaryMock.instance.glossaries)
        
        
    ]

}
