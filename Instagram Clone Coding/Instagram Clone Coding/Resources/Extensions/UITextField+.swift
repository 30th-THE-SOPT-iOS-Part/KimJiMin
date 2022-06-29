//
//  UITextField.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/30.
//

import UIKit

extension UITextField{
    func setPWSecureButton(){
        
        let pwSecureButton = UIButton(type:.custom)
        pwSecureButton.frame = CGRect(x: 0, y: 5, width: 25, height: 20)
        pwSecureButton.setImage(UIImage(named: "password hidden eye icon"), for: .normal)
        pwSecureButton.addTarget(self, action:  #selector(toggleSecurityMode), for: .touchUpInside)
        pwSecureButton.tintColor = .black
        
        let buttonContainer = UIView(frame:CGRect(x: 0, y: 0, width: 30, height: 30))
        buttonContainer.addSubview(pwSecureButton)
    
        self.rightView = buttonContainer
        self.rightViewMode = UITextField.ViewMode.always
    }
    
    @objc func toggleSecurityMode(_ sender:UIButton){
        self.isSecureTextEntry.toggle()
        
        let imageName = self.isSecureTextEntry ? "password hidden eye icon" : "password shown eye icon"
        sender.setImage(UIImage(named: imageName), for: .normal)
        sender.tintColor = .black
    }
}


