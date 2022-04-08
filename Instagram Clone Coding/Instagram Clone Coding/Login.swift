//
//  Login.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

class Login: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func gotoSignUpClicked(_ sender: Any) {
        guard let signUpNameVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpName") as?SignUpName else {return}
        
        self.navigationController?.pushViewController(signUpNameVC, animated: true)
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
