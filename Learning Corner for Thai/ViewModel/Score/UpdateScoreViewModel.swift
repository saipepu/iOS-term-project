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
        updateScore.execute(data: userScore,getMethod: "PUT") { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    print("Success")
                    break;
                case .failure(let error):
                    print(error.localizedDescription)
                    break;
                }
            }
        }
        
        
    }
    
    
    
}
