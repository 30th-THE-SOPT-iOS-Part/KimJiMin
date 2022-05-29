//
//  SignUpName.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

final class SignUpNameVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetTextField()
    }
    
    @IBAction func gotoPWClicked(_ sender: UIButton) {
        let signUpPwSB = UIStoryboard(name: "SignUpPw", bundle: nil)
        guard let signUpPwVC = signUpPwSB.instantiateViewController(withIdentifier: SignUpPwVC.reuseIdentifier) as? SignUpPwVC else {return}

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
