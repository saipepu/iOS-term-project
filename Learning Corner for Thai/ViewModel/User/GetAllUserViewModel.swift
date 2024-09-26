//
//  GetAllUserViewModel.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 26/09/2024.
//

import Foundation

class GetAllUserViewModel  {
    
    
    
  
    
    private(set) var userData: [UserModel]? = [] {
               didSet {
                   self.onUsersUpdated?()
               }
           }
    
    var onUsersUpdated: (()->Void)?
    
    var errorMessage: String? = nil
    init() {
        getAllUsers()
    }
    
   
    
    
    func getAllUsers() {
        errorMessage = nil
        let getAllUsers = GetAllUser()
        getAllUsers.execute(getMethod: "GET", token: nil) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let userData):
                    self.userData = userData.message
                case .failure(let error):
                    self.errorMessage = "Failed to get user detail by id: \(error.localizedDescription)"
                    print(self.errorMessage)
                }
            }
        }
    }
}


