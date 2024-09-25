//
//  BaseTabController.swift
//  ThaiLearn
//
//  Created by Swan Nay Phue Aung on 23/08/2024.
//

import UIKit

class BaseTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 1
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
    
             let tabBarAppearance = UITabBarAppearance()
             tabBarAppearance.backgroundColor = .white
             UITabBar.appearance().standardAppearance = tabBarAppearance
             UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        let homeVC = HomeViewController()
//                let homeVC = DetailViewController()
//            let homeVC = SignInViewController()
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: Constants.home), selectedImage: nil)
        
        
        let leaderboardVC = LeaderboardViewController()
        leaderboardVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: Constants.leaderboard), selectedImage: nil)
        
        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: Constants.profile), selectedImage: nil)
        

        let homeNavigation = UINavigationController(rootViewController: homeVC )
        let leaderboardNavigation = UINavigationController(rootViewController: leaderboardVC )
        let profileNavigation = UINavigationController(rootViewController: profileVC)
        
        
        viewControllers = [homeNavigation,leaderboardNavigation,profileNavigation]
      
    }
    


}
