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
        guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC"),
              let yellowVC = self.storyboard?.instantiateViewController(withIdentifier: "YellowVC"),
              let greenVC = self.storyboard?.instantiateViewController(withIdentifier: "GreenVC"),
              let blueVC = self.storyboard?.instantiateViewController(withIdentifier: "BlueVC"),
              let purpleVC = self.storyboard?.instantiateViewController(withIdentifier: "PurpleVC")
        else {return}
        
        mainVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "icn_home"),
            selectedImage: UIImage(named: "icn_home_selected")
        )
        yellowVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "icn_search"),
            selectedImage: UIImage(named: "icn_search_selected")
        )
        greenVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "icn_reels"),
            selectedImage: UIImage(named: "icn_reels_selected")
        )
        blueVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "icn_shop"),
            selectedImage: UIImage(named: "icn_shop_selected")
        )
        purpleVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "icn_profile"),
            selectedImage: UIImage(named: "icn_profile_selected")
        )
        
        setViewControllers([mainVC,yellowVC,greenVC,blueVC,purpleVC], animated: true)
    }
}
