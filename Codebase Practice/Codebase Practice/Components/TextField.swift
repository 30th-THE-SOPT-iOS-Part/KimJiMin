//
//  TextField.swift
//  Codebase Practice
//
//  Created by 김지민 on 2022/07/06.
//

import UIKit

class TextField: UITextField{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    //아래 주석-1 참고
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    private func setUI(){
        self.font = UIFont.systemFont(ofSize: 14)
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 4
        self.layer.borderColor = UIColor.systemGray5.cgColor
        self.layer.borderWidth = 1
        self.addLeftPadding(10)
    }
}

/* [주석-1]
 
 🙋🏻‍♀️ 야곰 책 18.3.6 요구 이니셜라이저:
  - 상속받을 때 반드시 재정의 해야 하는 이니셜라이저 앞에 required를 붙인다.
  - 자식클래스에서 재정의할 때 override 자리에 required를 사용한다.
 
 🙋🏻‍♀️ NSCoder:
  - 추상클래스
  - 어떤 객체가 다른 객체를 아카이빙/배포(분배)할 수 있게 함
  - Coder Clases(NSCoder를 구현하는 클래스들): NSArchiver, NSUnArchiver,
    Coder Classes들의 인스턴스를 Codier Objects, Coders라고 함.
 
 ➕ 아카이빙:
  - 객체와 데이터를 디스크에 저장하는 것.
  - 아카이빙이 지원되려면 객체가 반드시 NSCoding 프로토콜을 채택하고 있어야 한다.
    (Foundation에 포함된 모든 값 타입 객체들은 NSCoding 프로토콜 채택 중.)
    그 중 하나가 init?(coder: NSCoder).
  - 같이 더 공부해 보면 좋은 키워드: Serialization, Deserialization
 
 ➕ 배포(분배):
  - 객체와 데이터를 서로 다른 프로세스나 스레드 사이에서 복사하는 것.
 
 🙋🏻‍♀️ init(coder:): 스토리보드나 nib 파일을 통해 뷰를 로드하면서 커스텀하게 초기화를 해주고 싶을 때 사용.
    커스텀 클래스를 만드는 게 커스텀하게 초기화해주고 싶은 거니까 init(coder:)을 쓰는 것.
 
 ➕ Nib 파일: Interface Builder 문서.
    이 문서가 수정 후 저장되면 객체그래프가 생성되어 저장됨.
    이 문서를 로드하면 객체그래프가 언아카이빙(아카이빙하기 전 객체 그래프를 복원)됨.
    객체그래프의 모든 객체가 인스턴스화되고 초기화되고 나서 outlet, action 연결됨. 그리고 awakeFromNib불림.
 */
