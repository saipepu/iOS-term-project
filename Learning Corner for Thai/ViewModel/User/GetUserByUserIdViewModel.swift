//
//  GetUserByUserId.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 26/09/2024.
//

import Foundation

class GetUserByUserIdViewModel : ObservableObject {

    
    private(set) var userDetail: UserModel? = nil {
               didSet {
                   self.onUserUpdated?()
               }
           }
    
    var onUserUpdated: (()->Void)?

  var errorMessage: String? = nil
     
    
    
    init(id:String) {
        getOneUserById(id:id)
    }
     func getOneUserById(id: String) {
         errorMessage = nil
         let getOneUser = GetUserById(id: id)
         getOneUser.execute(getMethod: "GET", token: nil) { result in
             DispatchQueue.main.async {
                 switch result {
                 case .success(let userDetailData):
                     self.userDetail = userDetailData.message
                     print("Success getting one user")
                 case .failure(let error):
                     self.errorMessage = "Failed to get user detail by id: \(error.localizedDescription)"
                     print(self.errorMessage)
                 }
             }
         }
     }
 }
