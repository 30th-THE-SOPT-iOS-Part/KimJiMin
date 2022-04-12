//
//  Login.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

class Login: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var gotoWelcomeButton: UIButton!
    @IBOutlet weak var pwSecureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetTextField()
    }
    
    @IBAction func gotoWelcomeClicked(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "Welcome")as?Welcome else {return}
        
        welcomeVC.name = nameInput.text
        welcomeVC.modalTransitionStyle = .crossDissolve
        welcomeVC.modalPresentationStyle = .fullScreen
        
        self.present(welcomeVC,animated: true,completion: nil)
    }
    
    @IBAction func gotoSignUpClicked(_ sender: Any) {
        guard let signUpNameVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpName") as?SignUpName else {return}
        
        self.navigationController?.pushViewController(signUpNameVC, animated: true)
    }
    
    @IBAction func toggleSecurityMode(_ sender: Any) {
        passwordInput.isSecureTextEntry.toggle()
        let imageName = passwordInput.isSecureTextEntry ? "password hidden eye icon" : "password shown eye icon"
        pwSecureButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    func addTargetTextField() {
        self.nameInput.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        self.passwordInput.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
    }
    
    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        gotoWelcomeButton.isEnabled = nameInput.hasText && passwordInput.hasText
    }
}
