//
//  SignUpName.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

class SignUpName: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func gotoPWClicked(_ sender: Any) {
        guard let signUpPwVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpPw")as?SignUpPw else {return}
        
        self.navigationController?.pushViewController(signUpPwVC, animated: true)
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
