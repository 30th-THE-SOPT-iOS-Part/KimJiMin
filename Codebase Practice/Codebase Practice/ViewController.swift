//
//  ViewController.swift
//  Codebase Practice
//
//  Created by 김지민 on 2022/07/04.
//

/* [0단계]
 - SceneDelegate, info.plist 설정
 - SnapKit, Then 설치 및 import
*/

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {

    /* [1단계] view 인스턴스 생성 및 프로퍼티 선언
     - 개인적으로, 일단 필요한 UIView 리스트업하듯이 선언 먼저 쭉 해두고 2단계 갔다가 3단계 하러 돌아오는 게 편한 것 같다.
     
     
       [3단계] view 기초 설정.
     */
    private let logoImage = UIImageView().then{
        $0.image = UIImage(named: "Instagram Black Logo")
        $0.contentMode = .scaleAspectFit
    }
    
    private let emailTextField = UITextField().then{
        $0.placeholder = "전화번호, 사용자 이름 또는 이메일"
    }
    
    private let passwordTextField = UITextField().then{
        $0.placeholder = "비밀번호"
    }
    
    private let passwordFinderButton = UIButton().then{
        $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
    }
    
    private let signInButton = UIButton().then{
        $0.setTitle("로그인", for: .normal)
    }
    
    private let signUpLabel = UILabel().then{
        $0.text = "계정이 없으신가요?"
    }
    
    private let signUpButton = UIButton().then{
        $0.setTitle("가입하기", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.view.backgroundColor = .white
    }
}

extension ViewController {
    
    /* [2단계] view 추가 및 제약 조건 설정
     - addSubviews extension 파일에 만들어서 사용
     - 뷰.snp.makeConstraints{
            $0.방향.equalTo(기준).offset이나 inset(크기)
       }
     */
    private func configureUI() {
        view.addSubviews([logoImage, emailTextField, passwordTextField, passwordFinderButton, signInButton, signUpLabel, signUpButton])
        
        logoImage.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(170)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(100)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(100)
        }
        
        emailTextField.snp.makeConstraints{
            $0.top.equalTo(logoImage.snp.bottom).offset(34)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(16)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.top.equalTo(emailTextField.snp.bottom).offset(16)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(16)
        }
        
        passwordFinderButton.snp.makeConstraints{
            $0.top.equalTo(passwordTextField.snp.bottom).offset(16)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
        }
        
        signInButton.snp.makeConstraints{
            $0.top.equalTo(passwordFinderButton.snp.bottom).offset(34)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(16)
        }
        
        signUpLabel.snp.makeConstraints{
            $0.top.equalTo(signInButton.snp.bottom).offset(38)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(104)
        }
        
        signUpButton.snp.makeConstraints{
            $0.top.equalTo(signInButton.snp.bottom).offset(38)
            $0.leading.equalTo(signUpLabel.snp.trailing).offset(5)
        }
    }
    
    
}
