//
//  UIStackView+.swift
//  Codebase Practice
//
//  Created by 김지민 on 2022/07/05.
//
 import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
