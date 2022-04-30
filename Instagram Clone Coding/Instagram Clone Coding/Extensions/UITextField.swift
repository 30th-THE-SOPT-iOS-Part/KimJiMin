//
//  UITextField.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/30.
//

import UIKit

extension UITextField{
    func setPWSecureButton(){
        // ??? button에 오른쪽 여백 주고 싶어서 이것저것 해보고 inset에 대해서도 알아봤는데 해당 기능이 이제 없어졌다고 해서 버튼을 감싸는 뷰를 만들고 그 안에 버튼을 넣었습니다. 더 간결한 방법은 없을까요??
        
        let pwSecureButton: UIButton = UIButton(type:.custom)// custom : no button style.
        pwSecureButton.frame = CGRect(x: 0, y: 5, width: 25, height: 20)
        pwSecureButton.setImage(UIImage(named: "password hidden eye icon"), for: .normal)
        pwSecureButton.addTarget(self, action:  #selector(toggleSecurityMode), for: .touchUpInside)
        pwSecureButton.tintColor = .black
        
        let buttonContainer = UIView(frame:CGRect(x: 0, y: 0, width: 30, height: 30))
        buttonContainer.addSubview(pwSecureButton)
    
        self.rightView = buttonContainer
        self.rightViewMode = UITextField.ViewMode.always // textfield 속 텍스트의 길이가 길어지더라도 button 밀려나지 않고 자리 유지.
    }
    
    @objc func toggleSecurityMode(_ sender:UIButton){
        //target action method에는 매개변수를 전달할 수 없다.
        //target은 직접 전달해주지 않아도 기본적으로 전달된다. 자동으로 전달되는 이 인자를 받아 쓰기 위해 쓴 부분이 _ sender:~
        self.isSecureTextEntry.toggle()
        
        let imageName = self.isSecureTextEntry ? "password hidden eye icon" : "password shown eye icon"
        sender.setImage(UIImage(named: imageName), for: .normal)
        sender.tintColor = .black
    }
}


