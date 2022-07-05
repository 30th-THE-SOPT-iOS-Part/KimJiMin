//
//  UIView+.swift
//  Codebase Practice
//
//  Created by 김지민 on 2022/07/05.
//
import UIKit

extension UIView {
    
    //    func addSubviews(_ views: [UIView]) {
    //        for view in views {
    //            self.addSubview(view)
    //        }
    //    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
