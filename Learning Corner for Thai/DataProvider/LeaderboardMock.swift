//
//  LeaderboardMock.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 30/08/2024.
//

import Foundation

struct LeaderboardMock {
    static let instance = LeaderboardMock()
    private init() {}
    
    let leaderboardPersonA = LeaderboardModel(profileImage: Constants.profileImageA, name: "Geek", score: 2322)
    let leaderboardPersonB = LeaderboardModel(profileImage: Constants.profileImageB, name: "Pat", score: 3013)
    let leaderboardPersonC = LeaderboardModel(profileImage: Constants.profileImageC, name: "Flick", score: 1042)

    let leaderboardPeople = [
        LeaderboardModel(profileImage: Constants.profileImageA, name: "Geek", score: 2322),
        LeaderboardModel(profileImage: Constants.profileImageB, name: "Pat", score: 3013),
        LeaderboardModel(profileImage: Constants.profileImageC, name: "Flick", score: 1042)
    ]

}
