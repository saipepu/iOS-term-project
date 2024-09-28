//
//  UpdateUserViewModel.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 28/09/2024.
//

import Foundation

class UpdateUserViewModel {
    
    let coursesId : [String]
    
    init(coursesId: [String]) {
        self.coursesId = coursesId
    }
  
    
    func updateUser(userId:String){
        print("Update user func triggered")
        let courseData = UpdateUserCourseDTO(courses: coursesId)
        
        
        let updateUserEndPoint = UpdateUserEndPoint(userId: userId)
        updateUserEndPoint.execute(data: courseData,getMethod: "PATCH") { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    print("success updating user")
                    print(result.courses)
                    break;
                case .failure(let error):
                    print("Error \(error)")
                    print(error.localizedDescription)
                    break;
                }
            }
        }
        
        
    }
    
}

/*
 //
 //  UpdateScoreViewModel\.swift
 //  Learning Corner for Thai
 //
 //  Created by Swan Nay Phue Aung on 27/09/2024.
 //

 import Foundation

 class UpdateScoreViewModel {
     
     var point : Int
     var exp : Int
     
     init(point: Int, exp: Int) {
         self.point = point
         self.exp = exp
     }
     
     
     func updateScore(userId:String){
         print("Func triggered")
         let userScore = UpdateScoreDTO(point: point, exp: exp)
         
         
         let updateScore = UpdateScoreEndPoint(userId: userId)
         updateScore.execute(data: userScore,getMethod: "PATCH") { [weak self] result in
             DispatchQueue.main.async {
                 switch result {
                 case .success(_):
                     break;
                 case .failure(let error):
                     print("Error \(error)")
                     print(error.localizedDescription)
                     break;
                 }
             }
         }
         
         
     }
     
     
     
 }

 */
