//
//  UIButton+.swift
//  Codebase Practice
//
//  Created by 김지민 on 2022/07/06.
//

import UIKit

extension UIButton {
    func press(vibrate: Bool = false, for controlEvents: UIControl.Event = .touchUpInside, closure: @escaping ()->()) {
        self.addAction(UIAction {
            (action: UIAction) in closure()
        }, for: controlEvents)
    }
}
