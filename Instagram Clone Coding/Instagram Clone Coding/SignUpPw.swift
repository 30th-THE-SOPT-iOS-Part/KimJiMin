//
//  SIgnUpPw.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

class SignUpPw: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func gotoWelcomeClicked(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "Welcome") else {return}
        welcomeVC.modalTransitionStyle = .crossDissolve
        welcomeVC.modalPresentationStyle = .fullScreen
        self.present(welcomeVC,animated: true,completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
