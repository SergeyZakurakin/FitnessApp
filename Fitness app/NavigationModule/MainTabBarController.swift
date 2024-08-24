//
//  MainTabBarController.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/8/24.
//

import UIKit

class MainTabBarController: UITabBarController {

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupItems()
    }
 
    private func setupTabBar() {
        tabBar.backgroundColor = .specialTabBar
        // selected item
        tabBar.tintColor = .specialDarkGreen
        // unselected item
        tabBar.unselectedItemTintColor = .specialGray
        // stroke
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.specialLightBrown.cgColor
        
    }
    
    private func setupItems() {
        let mainVC = MainViewController()
        let statisticVC = StatisticViewController()
        let profileVC = ProfileViewController()
        // add viewControllers to tabBar
        setViewControllers([mainVC, statisticVC, profileVC], animated: true)
        
        // setup Items
        guard let items = tabBar.items else {return}
        
        items[0].title = "Main"
        items[1].title = "Statistic"
        items[2].title = "Profile"
        
        items[0].image = UIImage(named: "mainTabBar")
        items[1].image = UIImage(named: "statisticTabBar")
        items[2].image = UIImage(named: "profileTabBar")
            
        // setup font
        let font = UIFont(name: "Roboto-Bold", size: 12)
        UITabBarItem.appearance().setTitleTextAttributes([.font : font as Any, ], for: .normal)
    }
    
}
