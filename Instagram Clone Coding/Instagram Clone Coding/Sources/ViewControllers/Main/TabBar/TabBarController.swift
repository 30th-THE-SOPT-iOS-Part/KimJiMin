//
//  TabBarController.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/16.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarController()
    }

    func setTabBarController(){
        tabBar.unselectedItemTintColor = .black

        guard let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: HomeVC.reuseIdentifier)as? HomeVC ,
              let searchVC = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: SearchVC.reuseIdentifier)as? SearchVC,
              let reelsVC = UIStoryboard(name: "Reels", bundle: nil).instantiateViewController(withIdentifier: ReelsVC.reuseIdentifier)as? ReelsVC,
              let shopVC = UIStoryboard(name: "Shop", bundle: nil).instantiateViewController(withIdentifier: ShopVC.reuseIdentifier)as? ShopVC,
              let profileVC = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: ProfileVC.reuseIdentifier)as? ProfileVC
        else {return}
        
        homeVC.tabBarItem = UITabBarItem(
            title: "",
            image: Const.Image.icn_home,
            selectedImage: Const.Image.icn_home_selected
        )
        searchVC.tabBarItem = UITabBarItem(
            title: "",
            image: Const.Image.icn_search,
            selectedImage: Const.Image.icn_search_selected
        )
        reelsVC.tabBarItem = UITabBarItem(
            title: "",
            image: Const.Image.icn_reels,
            selectedImage: Const.Image.icn_reels_selected
        )
        shopVC.tabBarItem = UITabBarItem(
            title: "",
            image: Const.Image.icn_shop,
            selectedImage: Const.Image.icn_shop_selected
        )
        profileVC.tabBarItem = UITabBarItem(
            title: "",
            image: Const.Image.icn_profile,
            selectedImage: Const.Image.icn_profile_selected
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
            tabBar.unselectedItemTintColor = .black
        }
    }
}
