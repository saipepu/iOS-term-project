//
//  BaseTabController.swift
//  ThaiLearn
//
//  Created by Swan Nay Phue Aung on 23/08/2024.
//

import UIKit

class BaseTabController: UITabBarController {

    
    private let usersVM : GetAllUserViewModel = GetAllUserViewModel()
    private let coursesVM : GetCourseViewModel = GetCourseViewModel()
    private let assetsVM: GetAllAssetViewModel = GetAllAssetViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedIndex = 0
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .white
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        let currentUserId = "66f69e37c229ba6337074111"
            
        let homeVC = HomeViewController(usersVM: usersVM, coursesVM: coursesVM)
//        let homeVC = AssetShopViewController();
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: nil)
        
        
        let leaderboardVC = LeaderboardViewController(usersVM: usersVM)
        leaderboardVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: Constants.leaderboard), selectedImage: nil)
        
        let assetShopVC = AssetShopViewController(assetsVM: assetsVM)
        assetShopVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "bag"), selectedImage: nil)
        
        
        let homeNavigation = UINavigationController(rootViewController: homeVC )
        let leaderboardNavigation = UINavigationController(rootViewController: leaderboardVC )
        let assetShopNavigation = UINavigationController(rootViewController: assetShopVC)
        
        
        viewControllers = [homeNavigation,leaderboardNavigation,assetShopNavigation]
            
    }
    
    


}
