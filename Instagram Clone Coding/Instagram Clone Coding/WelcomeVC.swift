//
//  Welcome.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setName()
    }
    
    @IBAction func gotoLoginClicked(_ sender: Any) {
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        self.view.window?.rootViewController?.dismiss(animated: false){
            presentingVC.popToRootViewController(animated: true)}
    }
    
    private func setName(){
        if let name = name {
            nameLabel.text = "\(name)님 Instagram에 오신 것을 환영합니다"
            nameLabel.sizeToFit()
        }
    }

}