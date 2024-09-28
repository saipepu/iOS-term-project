//
//  UserSignUpViewModel.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 28/09/2024.
//

import Foundation
import KeychainSwift
import UIKit

class UserSignUpViewModel {
    
    
    var name : String
    var email : String
    var firebaseId : String
    
    let keyChain = KeychainSwift()
    
    
    init(name: String, email: String, firebaseId: String) {
        self.name = name
        self.email = email
        self.firebaseId = firebaseId
    }
    
    
    
    func signUp(){
        let userInfo = SignUpDTO(name: name, email: email, firebaseId: firebaseId)
        let signUpEndPoint = FirebaseSignUpEndPoint()
     
        signUpEndPoint.execute(data: userInfo,getMethod: "POST") { [weak self] result in
            print("result \(result)")
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    print("User is: \(user)")
                    let userId = user.message._id
                    self?.keyChain.set(userId ?? "", forKey: "userId")
                    print("userID: \(userId ?? "")")
                    print("Success CREATING USER")
                    UserDefaults.standard.set(true, forKey: "AppState")
                    
                    if let window = UIApplication.shared.connectedScenes
                        .compactMap({ $0 as? UIWindowScene })
                        .first?.windows.first {
                            
                            let homeViewController = BaseTabController() // Replace with your login VC
                            window.rootViewController = homeViewController
                            window.makeKeyAndVisible()
                            
                        }
                case .failure(let error):
                    print("Error creating user \(error)")
                    print(error.localizedDescription)
                }
            }
        }
        
        
    }
    
}

//FirebaseSignUpEndPoint
/*

 
 
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
 
 
 
 */
