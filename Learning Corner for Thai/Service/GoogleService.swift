//
//  GoogleService.swift
//  Learning Corner for Thai
//
//  Created by MacHD on 9/24/67.
//

import Foundation
import GoogleSignIn
import Firebase
import FirebaseAuth

class GoogleService {
    
    func signInWithGoogle() {
        print("GoogleService")
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: Application_utility.rootViewController) {
            result, error in
            if let error = error {
                print("Error with: \(error.localizedDescription)")
            }
            
            guard let user = result?.user, let idToken = user.idToken?.tokenString else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
                
                guard let _ = authResult else {
                    print("Firebase")
                    return
                }
                
                print("User successfully logged in")
                UserDefaults.standard.set(true, forKey: "AppState")
                
                if let window = UIApplication.shared.connectedScenes
                    .compactMap({ $0 as? UIWindowScene })
                    .first?.windows.first {
                        
                        let homeViewController = HomeViewController() // Replace with your login VC
                        window.rootViewController = homeViewController
                        window.makeKeyAndVisible()
                        
                    }
                

            }
            
        }
        
    }
    
    func signOutWithGoogle() {
        do {
            try Auth.auth().signOut()
            UserDefaults.standard.set(false, forKey: "AppState")
            
            // Set the new root view controller
            // screen.windows.first?.rootViewController
            if let window = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first?.windows.first {
                    
                    let signInViewController = SignInViewController() // Replace with your login VC
                    window.rootViewController = signInViewController
                    window.makeKeyAndVisible()
                    
                }

        } catch let signOutError as NSError {
            print("Error signing out: ", signOutError)
        }
    }
    
}
