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

