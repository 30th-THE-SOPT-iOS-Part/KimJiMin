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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonState()
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
    
    @IBAction func nameEdited(_ sender: Any) {
        setButtonState()
    }
    
    @IBAction func passwordEdited(_ sender: Any) {
        setButtonState()
    }
    
    private func setButtonState(){
        if (nameInput.hasText && passwordInput.hasText ) {
            gotoWelcomeButton.isEnabled = true
        }else{
            gotoWelcomeButton.isEnabled = false
        }
    }
}
