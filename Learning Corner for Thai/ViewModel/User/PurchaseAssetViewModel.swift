//
//  PurchaseAssetViewModel.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 28/09/2024.
//

import Foundation

class PurchaseAssetViewModel {
    
    var assetId : String

    init(assetId: String) {
        self.assetId = assetId
    }
    
    
    func buyItem(userId:String){
        let assetId = BuyAssetDTO(assetId: assetId)
        
        
        let purchaseAsset = PurchaseAssets(id: userId)
        purchaseAsset.execute(data: assetId,getMethod: "PATCH") { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    print("Success buying")
                    break;
                case .failure(let error):
                    print("Error buying \(error)")
                    print(error.localizedDescription)
                    break;
                }
            }
        }
        
        
    }
    
    
    
}
