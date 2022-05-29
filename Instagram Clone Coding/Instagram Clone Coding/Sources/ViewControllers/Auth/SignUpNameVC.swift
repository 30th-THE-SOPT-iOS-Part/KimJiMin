//
//  SignUpName.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

final class SignUpNameVC: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetTextField()
    }
    
    //MARK: - Functions
    func addTargetTextField() {
        self.nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
    }
    
    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        nextButton.isEnabled = nameTextField.hasText
    }
    
    // MARK: - @IBAction Properties
    @IBAction func gotoPWClicked(_ sender: UIButton) {
        let signUpPwSB = UIStoryboard(name: "SignUpPw", bundle: nil)
        guard let signUpPwVC = signUpPwSB.instantiateViewController(withIdentifier: SignUpPwVC.reuseIdentifier) as? SignUpPwVC else {return}

        signUpPwVC.name = nameTextField.text

        self.navigationController?.pushViewController(signUpPwVC, animated: true)
    }
}
