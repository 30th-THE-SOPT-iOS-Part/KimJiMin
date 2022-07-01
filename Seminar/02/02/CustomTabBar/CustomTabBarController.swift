//
//  CustomTabBarController.swift
//  02
//
//  Created by 김지민 on 2022/04/09.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarController()
    }
    //함수 작성 - 탭 바 컨트롤러 세팅
    func setTabBarController(){
        //1. 스토리보드 상에 있는 뷰 컨트롤러 안전하게 가져와서 인스턴스화하는 작업.
        //- 사용할 화면, 연결할 화면 가져오기
        guard let firstViewController = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController"),
              let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
        else {return}
        
        //2. 탭바 아이템 설정
        firstViewController.tabBarItem = UITabBarItem(
            title: "FirstTab", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill")
        )
        secondViewController.tabBarItem = UITabBarItem(
            title: "SecondTab", image: UIImage(named: "Home-1"), selectedImage: UIImage(named: "Home")
        )
        //3. 연결(화면-탭바컨트롤러)
        setViewControllers([firstViewController,secondViewController], animated: true)
    }
}
