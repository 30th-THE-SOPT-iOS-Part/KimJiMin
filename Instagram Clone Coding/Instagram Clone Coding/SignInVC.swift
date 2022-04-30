//
//  Login.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var pwSecureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPWSecureButton()
        addTargets()
    }
    
    func setPWSecureButton(){
        pwSecureButton.setBackgroundImage(UIImage(named: "password hidden eye icon"), for: .normal)
        passwordTextField.rightView = pwSecureButton
        passwordTextField.rightViewMode = UITextField.ViewMode.always
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        let welcomeSB = UIStoryboard(name: "Welcome", bundle: nil)
        guard let welcomeVC = welcomeSB.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
        
        welcomeVC.name = nameTextField.text
        welcomeVC.modalTransitionStyle = .crossDissolve
        welcomeVC.modalPresentationStyle = .fullScreen
        
        self.present(welcomeVC,animated: true,completion: nil)
    }
    
    @IBAction func gotoSignUpClicked(_ sender: Any) {
        let signUpNameSB = UIStoryboard(name: "SignUpName", bundle: nil)
        guard let signUpNameVC = signUpNameSB.instantiateViewController(withIdentifier: "SignUpNameVC") as? SignUpNameVC else {return}
        
        self.navigationController?.pushViewController(signUpNameVC, animated: true)
    }
    
    func addTargets() {
        [nameTextField, passwordTextField].forEach {
              $0?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
        pwSecureButton.addTarget(self, action:  #selector(toggleSecurityMode), for: .touchUpInside)
    }
    
    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        loginButton.isEnabled = nameTextField.hasText && passwordTextField.hasText
    }
    
    @objc func toggleSecurityMode(){
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "password hidden eye icon" : "password shown eye icon"
        pwSecureButton.setImage(UIImage(named: imageName), for: .normal)
    }
}
