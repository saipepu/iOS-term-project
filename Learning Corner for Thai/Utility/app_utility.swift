//
//  app_utility.swift
//  Learning Corner for Thai
//
//  Created by MacHD on 9/24/67.
//

import Foundation
import UIKit

final class Application_utility {
    
    static var rootViewController: UIViewController {
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
        
    }
}
