//
//  ViewController.swift
//  Codebase Practice
//
//  Created by 김지민 on 2022/07/04.
//

//[0단계] SnapKit, Then 설치 및 import
import UIKit
import SnapKit
import Then

class ViewController: UIViewController {

    //[1단계] view 인스턴스 생성 및 프로퍼티 선언
    private let logoImage = UIImageView()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let passwordFinderButton = UIButton()
    private let signInButton = UIButton()
    private let signUpLabel = UILabel()
    private let signUpButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.view.backgroundColor = .green
    }
}

extension ViewController {
    
    //[2단계] view 추가 및 제약 조건 설정
    private func configureUI() {
        view.addSubviews([logoImage, emailTextField, passwordTextField, passwordFinderButton, signInButton, signUpLabel, signUpButton])

    }
    
}
