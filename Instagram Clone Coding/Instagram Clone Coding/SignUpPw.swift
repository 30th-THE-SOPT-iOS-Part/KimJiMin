//
//  SIgnUpPw.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

class SignUpPw: UIViewController {
    
    var name: String?
    
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pwSecureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonState()
    }
    
    @IBAction func passwordEdited(_ sender: Any) {
        setButtonState()
    }
    
    @IBAction func gotoWelcomeClicked(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "Welcome")as?Welcome else {return}
        welcomeVC.modalTransitionStyle = .crossDissolve
        welcomeVC.modalPresentationStyle = .fullScreen
        welcomeVC.name = name
        self.present(welcomeVC,animated: true,completion: nil)
    }
    
    @IBAction func toggleSecurityMode(_ sender: Any) {
        passwordInput.isSecureTextEntry.toggle()
        let imageName = passwordInput.isSecureTextEntry ? "password hidden eye icon" : "password shown eye icon"
        pwSecureButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    private func setButtonState(){
        if (passwordInput.hasText) {
            nextButton.isEnabled = true
        }else{
            nextButton.isEnabled = false
        }
    }

}
