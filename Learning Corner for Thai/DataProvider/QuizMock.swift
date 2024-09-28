//
//  QuizMock.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 24/09/2024.
//

import Foundation

struct QuizMock {
    
    static let shared = QuizMock()
    private init() {}
    
    let quizA = QuizModel(
        _id: "1", audioFile: "",
        question: "What is the capital of France?",
        photo: "paris.jpg",
        options: [
            OptionModel(_id: "1", content: "Paris", isCorrect: true, photo: "paris_option.jpg"),
            OptionModel(_id: "2", content: "London", isCorrect: false, photo: "london_option.jpg"),
            OptionModel(_id: "3", content: "Berlin", isCorrect: false, photo: "berlin_option.jpg"),
            OptionModel(_id: "4", content: "Madrid", isCorrect: false, photo: "madrid_option.jpg")
        ],
        point: 10
    )
    
    let quizB = QuizModel(
        _id: "2", audioFile: "",
        question: "What is the capital of Myanmar?",
        photo: "paris.jpg",
        options: [
            OptionModel(_id: "1", content: "Paris", isCorrect: true, photo: "paris_option.jpg"),
            OptionModel(_id: "2", content: "London", isCorrect: false, photo: "london_option.jpg"),
            OptionModel(_id: "3", content: "Berlin", isCorrect: false, photo: "berlin_option.jpg"),
            OptionModel(_id: "4", content: "Madrid", isCorrect: false, photo: "madrid_option.jpg")
        ],
        point: 10
    )
    
    
    let quizC = QuizModel(
        _id: "3", audioFile: "",
        question: "What is the capital of Africa?",
        photo: "paris.jpg",
        options: [
            OptionModel(_id: "1", content: "Paris", isCorrect: true, photo: "paris_option.jpg"),
            OptionModel(_id: "2", content: "London", isCorrect: false, photo: "london_option.jpg"),
            OptionModel(_id: "3", content: "Berlin", isCorrect: false, photo: "berlin_option.jpg"),
            OptionModel(_id: "4", content: "Madrid", isCorrect: false, photo: "madrid_option.jpg")
        ],
        point: 10
    )

    let quizzes = [
        QuizModel(
            _id: "1", audioFile: "",
            question: "What is the capital of Mandalay?",
            photo: "paris.jpg",
            options: [
                OptionModel(_id: "1", content: "KyawYi", isCorrect: true, photo: "paris_option.jpg"),
                OptionModel(_id: "2", content: "KyawYi", isCorrect: false, photo: "london_option.jpg"),
                OptionModel(_id: "3", content: "KyawYi", isCorrect: false, photo: "berlin_option.jpg"),
                OptionModel(_id: "4", content: "KyawYi", isCorrect: false, photo: "madrid_option.jpg")
            ],
            point: 10
        ),
        
        QuizModel(
            _id: "2", audioFile: "",
            question: "What is the capital of Myanmar?",
            photo: "paris.jpg",
            options: [
                OptionModel(_id: "1", content: "6gwae", isCorrect: true, photo: "paris_option.jpg"),
                OptionModel(_id: "2", content: "6gwae", isCorrect: false, photo: "london_option.jpg"),
                OptionModel(_id: "3", content: "6gwae", isCorrect: false, photo: "berlin_option.jpg"),
                OptionModel(_id: "4", content: "6gwae", isCorrect: false, photo: "madrid_option.jpg")
            ],
            point: 10
        ),
        
        QuizModel(
            _id: "3", audioFile: "",
            question: "What is the capital of Africa?",
            photo: "paris.jpg",
            options: [
                OptionModel(_id: "1", content: "Nigga", isCorrect: true, photo: "paris_option.jpg"),
                OptionModel(_id: "2", content: "Nigga", isCorrect: false, photo: "london_option.jpg"),
                OptionModel(_id: "3", content: "Nigga", isCorrect: false, photo: "berlin_option.jpg"),
                OptionModel(_id: "4", content: "Nigga", isCorrect: false, photo: "madrid_option.jpg")
            ],
            point: 10
        )
        
        
        
    ]
    
}
