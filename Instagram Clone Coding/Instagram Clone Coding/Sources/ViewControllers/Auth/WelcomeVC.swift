//
//  Welcome.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

final class WelcomeVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String?
    var password:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setName()
    }
    
    @IBAction func gotoSignInClicked(_ sender: UIButton) {
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        self.view.window?.rootViewController?.dismiss(animated: false){
            presentingVC.popToRootViewController(animated: true)}
    }
    
    @IBAction func completeSignInClicked(_ sender: UIButton) {
        signUp()
        
    }

    private func setName(){
        if let name = name {
            nameLabel.text = "\(name)님 Instagram에 오신 것을 환영합니다"
        }
    }

}
extension WelcomeVC {
    func signUp() {
        
        guard let name = name,
              let password = password
        else { return }
        
        SignUpService.shared.signUp(
            name: name,
            email: name,
            password: password) { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
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
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        self.view.window?.rootViewController?.dismiss(animated: false){
                   presentingVC.popToRootViewController(animated: true)}
    }
}
