//
//  SignUpName.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

class SignUpNameVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetTextField()
    }
    
    @IBAction func gotoPWClicked(_ sender: Any) {
        let signUpPwSB = UIStoryboard(name: "SignUpPw", bundle: nil)
        guard let signUpPwVC = signUpPwSB.instantiateViewController(withIdentifier: "SignUpPwVC") as? SignUpPwVC else {return}

        signUpPwVC.name = nameTextField.text

        self.navigationController?.pushViewController(signUpPwVC, animated: true)
    }
    
    func addTargetTextField() {
        self.nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
    }
    
    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        nextButton.isEnabled = nameTextField.hasText
    }
}