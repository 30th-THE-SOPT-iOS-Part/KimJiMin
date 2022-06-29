//
//  UIImageView+.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/06/27.
//

import UIKit

extension UIImageView {
    func load(_ URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image.resizeImage()
                    }
                }
            }
        }
    }
}
