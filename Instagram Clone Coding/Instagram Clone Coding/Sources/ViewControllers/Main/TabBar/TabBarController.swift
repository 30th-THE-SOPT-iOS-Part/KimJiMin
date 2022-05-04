//
//  TabBarController.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/16.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarController()
    }

    func setTabBarController(){
        tabBar.unselectedItemTintColor = .black

        guard let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")as? HomeVC ,
              let searchVC = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "SearchVC")as? SearchVC,
              let reelsVC = UIStoryboard(name: "Reels", bundle: nil).instantiateViewController(withIdentifier: "ReelsVC")as? ReelsVC,
              let shopVC = UIStoryboard(name: "Shop", bundle: nil).instantiateViewController(withIdentifier: "ShopVC")as? ShopVC,
              let profileVC = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC")as? ProfileVC
        else {return}
        
        homeVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "icn_home"),
            selectedImage: UIImage(named: "icn_home_selected")
        )
        searchVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "icn_search"),
            selectedImage: UIImage(named: "icn_search_selected")
        )
        reelsVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "icn_reels"),
            selectedImage: UIImage(named: "icn_reels_selected")
        )
        shopVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "icn_shop"),
            selectedImage: UIImage(named: "icn_shop_selected")
        )
        profileVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "icn_profile"),
            selectedImage: UIImage(named: "icn_profile_selected")
        )
        
        setViewControllers([homeVC,searchVC,reelsVC,shopVC,profileVC], animated: true)
    }
}

extension TabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == (tabBar.items!)[2]{
            tabBar.barTintColor = .black
            tabBar.tintColor = .white
            tabBar.unselectedItemTintColor = .white
        }else {
            tabBar.barTintColor = .white
            tabBar.tintColor = .black
            tabBar.unselectedItemTintColor = .black
        }
    }
}
