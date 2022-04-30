//
//  SIgnUpPw.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

class SignUpPwVC: UIViewController {
    
    var name: String?
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTargets()
    }
    
    @IBAction func gotoWelcomeClicked(_ sender: Any) {
        let welcomeSB = UIStoryboard(name: "Welcome", bundle: nil)
        guard let welcomeVC = welcomeSB.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
        
        welcomeVC.modalTransitionStyle = .crossDissolve
        welcomeVC.modalPresentationStyle = .fullScreen
        welcomeVC.name = name
        self.present(welcomeVC,animated: true,completion: nil)
    }
    
    func setTargets() {
        self.passwordTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        passwordTextField.setPWSecureButton()
    }
    
    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        nextButton.isEnabled = passwordTextField.hasText
    }
}
