//
//  Login.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

extension UITextField {

    @objc func toggleSecureTextEntry(){
        self.isSecureTextEntry.toggle()
        let imageName = self.isSecureTextEntry ? "password hidden eye icon" : "password shown eye icon"
        let subViews = self.subviews
            print(subViews)
        for eachView in subViews {
            if eachView is UIButton {
                print("Hello")
                let currentButton = eachView as! UIButton
                currentButton.setImage(UIImage(named: imageName), for: .normal)
            }
        }
    }

    func setButton(){
        let imageName = self.isSecureTextEntry ? "password hidden eye icon" : "password shown eye icon"
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 10, y: 5, width: 20, height: 20)
        button.setImage( UIImage(named: imageName), for: .normal)
        button.addTarget(self, action: #selector(toggleSecureTextEntry), for: .touchUpInside)
       let buttonCV: UIView = UIView(frame:
                      CGRect(x: 20, y: 0, width: 40, height: 30))
        buttonCV.addSubview(button)
       rightView = buttonCV
       rightViewMode = .always
        
    }
    
}

class Login: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!{
        didSet {
            passwordInput.tintColor = UIColor.lightGray
            passwordInput.setButton()
           }
    }
    
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
