//
//  Reusable.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/05/23.
//

import Foundation
import UIKit
// identifier의 반복되는 선언을 덜어주는 프로토콜입니다
protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable {}
extension UICollectionViewCell: Reusable {}
extension UIViewController: Reusable {}
