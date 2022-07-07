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
     
       [3단계] view별 UI 기초 설정.
     */
    private let logoImage = UIImageView().then{
        $0.image = UIImage(named: "Instagram Black Logo")
        $0.contentMode = .scaleAspectFit
    }
    
    /* Stack View 쓴 이유 :
       1. leading, trailing, height constraints 코드 겹침
       2. 둘 높이 같으니까 fillEqually로 하고 spacing, stackView 전체 높이만 설정해 주면 두 뷰의 높이는 알아서 동일하게 결정되게 만들면 편할 것 같아서
     */
    lazy var textFieldStackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField]).then{
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 12
    }
    
    //TODO: - TextField 속성 겹치는 건 따로 파일 만들어 커스텀 클래스 만들어두기.
    private let emailTextField = TextField().then{
        $0.placeholder = "전화번호, 사용자 이름 또는 이메일"
    }
    
    private let passwordTextField = TextField().then{
        $0.placeholder = "비밀번호"
    }
    
    private let passwordFinderButton = UIButton().then{
        $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 10)
    }
    
    private let signInButton = UIButton().then{
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.layer.cornerRadius = 4
    }
    
    /* let 으로 쓰면 :
     Cannot use instance member 'signUpButton' within property initializer; property initializers run before 'self' is available
     */
    /* Stack View 쓴 이유 :
       1. top constraints 코드 겹침.
       2. 나란히 정렬시키려고.
     */
    lazy var signUpStackView = UIStackView(arrangedSubviews: [signUpLabel, signUpButton]).then{
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
    }
    
    private let signUpLabel = UILabel().then{
        $0.text = "계정이 없으신가요?"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .systemGray
        $0.sizeToFit()
    }
    
    private let signUpButton = UIButton().then{
        $0.setTitle("가입하기", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        view.backgroundColor = .white
        setDidTapSignInButton()
    }
    
    private func setDidTapSignInButton(){
        signInButton.press {[weak self] in
            print("~~")
            let alertController = UIAlertController(title: "로그인 완료😺", message: nil, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "확인", style: .default, handler: { action in
                        self?.okActionHandler()
                    })
            alertController.addAction(okAction)
            self?.present(alertController, animated: true)
        }
    }
    
    private func okActionHandler(){
            guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
            self.view.window?.rootViewController?.dismiss(animated: false){
                       presentingVC.popToRootViewController(animated: true)}
        }
}

extension ViewController {
    
    /* [2단계] view 추가 및 제약 조건 설정
     - addSubviews extension 파일에 만들어서 사용
     - 뷰.snp.makeConstraints{
            $0.방향.equalTo(기준).offset이나 inset(크기)
        }
     */
    private func setLayout() {
        view.addSubviews([logoImage,textFieldStackView, passwordFinderButton, signInButton,signUpStackView])
        
        logoImage.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(170)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(100)
            
            // offset쓰고 음수 써도 되지만 양수로 통일하는 게 개인적으로 더 편한 것 같다.
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(100)
        }
        
        textFieldStackView.snp.makeConstraints{
            $0.top.equalTo(logoImage.snp.bottom).offset(34)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(16)
            $0.height.equalTo(96)
        }
        
        passwordFinderButton.snp.makeConstraints{
            $0.top.equalTo(passwordTextField.snp.bottom).offset(19)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(16)
        }
        
        signInButton.snp.makeConstraints{
            $0.top.equalTo(passwordFinderButton.snp.bottom).offset(34)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(16)
            $0.height.equalTo(44)
        }
        
        signUpStackView.snp.makeConstraints{
            $0.top.equalTo(signInButton.snp.bottom).offset(38)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(100)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(100)
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewController().showPreview()
    }
}
#endif
