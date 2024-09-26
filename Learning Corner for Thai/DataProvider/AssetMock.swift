//
//  AssetMock.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 26/09/2024.
//

import Foundation

struct AssetMock {
    static let shared = AssetMock()
    private init() {}
    
    let assetA = AssetModel(_id: "1", name: "Nike", photo: "", point: 3)
    let assetB = AssetModel(_id: "2", name: "Adidas", photo: "", point: 23)
    let assetC = AssetModel(_id: "3", name: "Puma", photo: "", point: 41)
    let assetD = AssetModel(_id: "4", name: "New Balance", photo: "", point: 12)

    let assets = [
        AssetModel(_id: "1", name: "Nike", photo: "", point: 3),
        AssetModel(_id: "2", name: "Adidas", photo: "", point: 23),
        AssetModel(_id: "3", name: "Puma", photo: "", point: 41),
        AssetModel(_id: "4", name: "New Balance", photo: "", point: 12)
    ]
}
