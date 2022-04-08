//
//  SignUpName.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

class SignUpName: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func gotoPWClicked(_ sender: Any) {
        guard let signUpPwVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpPw")as?SignUpPw else {return}

        signUpPwVC.name = nameInput.text

        self.navigationController?.pushViewController(signUpPwVC, animated: true)
    }
}
