//
//  GetUserByUserId.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 26/09/2024.
//

import Foundation

class GetUserByUserIdViewModel : ObservableObject {

    
    static let instance = GetUserByUserIdViewModel()
    private init() { }
    
    @Published var userDetail: UserModel? = nil
    @Published var errorMessage: String? = nil
     
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
