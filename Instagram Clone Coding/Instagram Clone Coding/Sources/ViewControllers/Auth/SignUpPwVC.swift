//
//  SIgnUpPw.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

final class SignUpPwVC: UIViewController {
    
    // MARK: - Properties
    var name: String?
    var password: String?
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTargets()
    }
    
    //MARK: - Functions
    func setTargets() {
        self.passwordTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        passwordTextField.setPWSecureButton()
    }
    
    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        nextButton.isEnabled = passwordTextField.hasText
    }
    
    // MARK: - @IBAction Properties
    @IBAction func gotoWelcomeClicked(_ sender: UIButton) {
        let welcomeSB = UIStoryboard(name: "Welcome", bundle: nil)
        guard let welcomeVC = welcomeSB.instantiateViewController(withIdentifier: WelcomeVC.reuseIdentifier) as? WelcomeVC else {return}
        
        welcomeVC.modalTransitionStyle = .crossDissolve
        welcomeVC.modalPresentationStyle = .fullScreen
        welcomeVC.name = name
        welcomeVC.password = passwordTextField.text
        self.present(welcomeVC,animated: true)
    }
}
