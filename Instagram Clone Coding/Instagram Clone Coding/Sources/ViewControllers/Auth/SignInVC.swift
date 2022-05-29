//
//  Login.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

final class SignInVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTargets()
    }
    
    @IBAction func signInButtonClicked(_ sender: UIButton) {
        signIn()
    }
    
    @IBAction func gotoSignUpClicked(_ sender: UIButton) {
        let signUpNameSB = UIStoryboard(name: "SignUpName", bundle: nil)
        guard let signUpNameVC = signUpNameSB.instantiateViewController(withIdentifier: SignUpNameVC.reuseIdentifier) as? SignUpNameVC else {return}
        
        self.navigationController?.pushViewController(signUpNameVC, animated: true)
    }
    
    func setTargets() {
        [nameTextField, passwordTextField].forEach {
              $0?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
        passwordTextField.setPWSecureButton()
    }
    
    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        signInButton.isEnabled = nameTextField.hasText && passwordTextField.hasText
    }
}
extension SignInVC {
    func signIn() {
        
        guard let name = nameTextField.text,
              let password = passwordTextField.text
        else { return }
        
        SignInService.shared.signIn(
            name: name,
            email: name,
            password: password) { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignInResponse else { return }
                print(data)
                self.alert(message: data.message)
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    func alert(message: String) {
        print("alert function")
        let alertVC = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { action in
            self.okActionHandler()
        })
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }
    
    func okActionHandler(){
        var mainView: UIStoryboard!
                  mainView = UIStoryboard(name: "TabBar", bundle: nil)
        let tabBarController = mainView.instantiateViewController(withIdentifier: TabBarController.reuseIdentifier) as! UITabBarController
        self.view.window?.rootViewController = tabBarController
    }
}
