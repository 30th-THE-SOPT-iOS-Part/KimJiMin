//
//  SIgnUpPw.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

class SignUpPw: UIViewController {
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func gotoWelcomeClicked(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "Welcome")as?Welcome else {return}
        welcomeVC.modalTransitionStyle = .crossDissolve
        welcomeVC.modalPresentationStyle = .fullScreen
        welcomeVC.name = name
        self.present(welcomeVC,animated: true,completion: nil)
    }
    

}
