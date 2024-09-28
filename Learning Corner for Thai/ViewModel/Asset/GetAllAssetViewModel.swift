//
//  GetAssetViewModel.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 26/09/2024.
//

import Foundation

class GetAllAssetViewModel {
    
    
    private (set) var assetData: [AssetModel]? = [] {
        didSet {
            self.onAssetUpdate?()
        }
        
    }
     var errorMessage: String? = nil
    
    
    var onAssetUpdate: (()->Void)?
    
    
    init() {
        
        getAllAssets()
        
    }
  

    func getAllAssets() {
        errorMessage = nil
        let getAllAssets = GetAllAssets()
        getAllAssets.execute(getMethod: "GET", token: nil) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let assetData):
                    self.assetData = assetData.message
                case .failure(let error):
                    self.errorMessage = "Failed to get asset list by id: \(error.localizedDescription)"
                    print(self.errorMessage)
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
}
